package model

import (
	"bufio"
	"context"
	"errors"
	"fmt"
	"io"
	"net/http"
	"net/url"
	"os"
	"path/filepath"
	str "strings"
	"sync"

	"github.com/PuerkitoBio/goquery"
	. "github.com/TENX-S/backend/common"
	"github.com/go-redis/redis/v8"
	"github.com/google/uuid"
	"github.com/jmoiron/sqlx"
	"github.com/meilisearch/meilisearch-go"
	"github.com/tencentyun/cos-go-sdk-v5"
)

var DB *sqlx.DB
var KV *redis.Client
var CC *cos.Client
var MI *meilisearch.Client

var BG context.Context

var EC = make(chan error)
var PC = make(chan Post, 1000)

var PW sync.WaitGroup
var QW sync.WaitGroup

func InitModel() {
	defer L.Info("[SERVICE] [INITIALIZATION COMPLETED]")
	defer close(EC)
	defer QW.Wait()

	go initErrHandler()
	initDB()
	initCC()
	initDBUser()
	initDBPostAndMeili()
	initKV()
}

func initErrHandler() {
	for err := range EC {
		if err != nil {
			panic(err.Error())
		}
	}
}

func initDB() {
	var err error
	dsn := fmt.Sprintf("%s:%s@tcp(%s)/%s", E.MYSQL_HOST, E.MYSQL_PASS, E.MYSQL_ADDR, E.DB_NAME)
	DB, err = sqlx.Connect("mysql", dsn)
	EC <- err
	DB.SetMaxOpenConns(100000)
	DB.MustExec(userSchema)
	DB.MustExec(postSchema)
}

func initCC() {
	u, err := url.Parse(E.TENCENT_COS_BUCKET)
	bucket := &cos.BaseURL{BucketURL: u}
	CC = cos.NewClient(bucket, &http.Client{
		Transport: &cos.AuthorizationTransport{
			SecretID:  E.TENCENT_COS_SECRET_ID,
			SecretKey: E.TENCENT_COS_SECRET_KEY,
		},
	})
	EC <- err
}

func initDBUser() {
	tx := DB.MustBegin()
	var test User
	test.New(E.TEST_USER_EMAIL, E.TEST_USER_PSWD)
	_, err := tx.NamedExec(SignUpTestUser, &test)
	EC <- err
	EC <- tx.Commit()
}

func initDBPostAndMeili() {
	MI = meilisearch.NewClient(meilisearch.ClientConfig{
		Host: E.MEILI_ADDR,
	})

	var data []string
	data, err := filepath.Glob(filepath.Join("data", "html", "*.html"))
	EC <- err
	if len(data) == 0 {
		EC <- errors.New("[POST] [EMPTY_DATA]")
	}
	for i := range data {
		PW.Add(1)
		go parseData(i + 1)
	}
	PW.Wait()
	close(PC)
	tx := DB.MustBegin()
	docs := make([]map[string]string, 0)
	for p := range PC {
		_, err = tx.NamedExec(AddPost, p)
		docs = append(docs, p.toMap())
		EC <- err
	}
	EC <- tx.Commit()

	_, err = MI.Index("posts").AddDocuments(docs)
	EC <- err
}

func parseData(num int) {
	defer PW.Done()
	var p Post
	p.Id = uuid.New()
	path := filepath.Join("data", "html", fmt.Sprintf("%d.html", num))

	var reader io.Reader
	reader, err := os.OpenFile(path, os.O_RDONLY, 0444)
	EC <- err

	var doc *goquery.Document
	doc, err = goquery.NewDocumentFromReader(reader)
	EC <- err

	name := str.TrimSpace(doc.Find(".cj_ertitlere").First().Text())
	p.Name = name

	var descs []string
	doc.Find(".cj_e_canshu").First().Children().Each(func(i int, s *goquery.Selection) {
		descs = append(descs, str.TrimSpace(s.Text()))
	})
	descr := str.Join(descs, "-")
	p.Descr = descr

	dynasty := str.TrimSpace(doc.Find(".cj_e_qing").First().Text())
	if str.Contains(dynasty, "汉") {
		dynasty = "汉"
	} else if str.Contains(dynasty, "战国") {
		dynasty = "战国"
	} else if str.Contains(dynasty, "明") {
		dynasty = "明"
	} else if str.Contains(dynasty, "新石器") {
		dynasty = "新石器"
	} else if str.Contains(dynasty, "晋") {
		dynasty = "晋"
	}

	p.Dynasty = dynasty

	var intros []string
	doc.Find(".wwms").First().Children().Each(func(i int, s *goquery.Selection) {
		lines := bufio.NewScanner(str.NewReader(str.TrimSpace(s.Text())))
		for lines.Scan() {
			intros = append(intros, str.TrimSpace(lines.Text()))
		}
	})
	intro := str.Join(intros, "-")

	stupid := str.Index(intro, "--延伸阅读")
	if stupid != -1 {
		intro = intro[:stupid]
	}
	p.Intro = intro

	doc.Find(".cj_small_img").First().Each(func(i int, s *goquery.Selection) {
		r, exists := s.Children().First().Attr("src")
		if !exists {
			EC <- fmt.Errorf("[POST] [PIC_MISSED:%d.html]", num)
		} else {
			p.Pic = UploadPic2Cos(filepath.Join("data", "html", r), num)
		}
	})
	PC <- p
}

func initKV() {
	KV = redis.NewClient(&redis.Options{
		Addr:     E.REDIS_ADDR,
		Password: "",
		DB:       0,
	})

	BG = context.Background()
	var posts []Post
	tx := DB.MustBegin()
	EC <- tx.Select(&posts, FetchAllPosts)
	EC <- tx.Commit()
	for _, p := range posts {
		EC <- KV.RPush(BG, "pid", p.Id.String()).Err()
		EC <- KV.RPush(BG, p.Id.String(), p.toArr()).Err()
		QW.Add(1)
		go p.initQRCode()
	}
}

func UploadPic2Cos(src string, num int) string {
	key := fmt.Sprintf("pic/%d%s", num, filepath.Ext(src))
	exist, err := CC.Object.IsExist(context.Background(), key)
	EC <- err
	if !exist {
		_, res, err := CC.Object.Upload(context.Background(), key, src, nil)
		EC <- err
		if res.StatusCode != 200 {
			EC <- fmt.Errorf("[POST] [UPLOAD:PIC:FAILED:%s->%s]", src, key)
		} else {
			L.Printf("[POST] [UPLOAD:PIC:SUCCESS:%s->%s]", src, key)
		}
	}
	return fmt.Sprintf("%s/%s", E.TENCENT_CDN, key)
}
