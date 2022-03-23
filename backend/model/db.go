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
	"github.com/tencentyun/cos-go-sdk-v5"
)

var salt = "我时常被雨淋透，我还未遇到喜欢的伞"
var DB *sqlx.DB
var KV *redis.Client
var BG context.Context
var EC = make(chan error)
var PC = make(chan Post, 100)
var PW sync.WaitGroup
var COS_CLIENT *cos.Client

func init() {
	defer Logger.Info("Data initialization is complete")
	defer close(EC)

	go handleInitErr()

	var err error
	dsn := fmt.Sprintf("%s:%s@tcp(%s)/museum", E.MYSQL_HOST, E.MYSQL_PASS, E.MYSQL_ADDR)
	DB, err = sqlx.Connect("mysql", dsn)
	EC <- err

	DB.MustExec(userSchema)
	DB.MustExec(postSchema)

	tx := DB.MustBegin()
	test := User{Email: "test@test.com", PswdHash: GetHashFromPswd("test")}
	_, err = tx.NamedExec(SignUpTestUser, &test)
	EC <- err
	EC <- tx.Commit()

	KV = redis.NewClient(&redis.Options{
		Addr:     E.REDIS_ADDR,
		Password: "",
		DB:       0,
	})

	var files []string
	files, err = filepath.Glob(filepath.Join("data", "html", "*.html"))
	EC <- err
	if len(files) == 0 {
		EC <- errors.New("NO data!")
	}
	InitCOSClient()
	for i := range files {
		PW.Add(1)
		go parseData(i + 1)
	}
	PW.Wait()
	close(PC)
	os.MkdirAll("qrcodes", os.ModePerm)
	var pairs []string
	for p := range PC {
		tx = DB.MustBegin()
		_, err = tx.NamedExec(AddPost, p)
		EC <- err
		EC <- tx.Commit()
		EC <- p.GenQrCode()
		pairs = append(pairs, p.Id.String(), p.PackedField())
	}
	BG = context.Background()
	EC <- KV.MSet(BG, pairs).Err()
}

func handleInitErr() {
	for err := range EC {
		if err != nil {
			panic(err.Error())
		}
	}
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
			EC <- fmt.Errorf("%d.html doesn't contain pic", num)
		} else {
			p.Pic = Upload2COS(filepath.Join("data", "html", r), num)
		}
	})
	PC <- p
}

func InitCOSClient() {
	u, err := url.Parse(E.TENCENT_COS_BUCKET)
	bucket := &cos.BaseURL{BucketURL: u}
	COS_CLIENT = cos.NewClient(bucket, &http.Client{
		Transport: &cos.AuthorizationTransport{
			SecretID:  E.TENCENT_COS_SECRET_ID,
			SecretKey: E.TENCENT_COS_SECRET_KEY,
		},
	})
	EC <- err
}

func Upload2COS(src string, num int) string {
	key := fmt.Sprintf("pic/%d%s", num, filepath.Ext(src))
	exist, err := COS_CLIENT.Object.IsExist(context.Background(), key)
	EC <- err
	if !exist {
		Logger.Printf("%s not exists. uploading soon", key)
		_, _, err = COS_CLIENT.Object.Upload(context.Background(), key, src, nil)
		EC <- err
	}
	return fmt.Sprintf("%s/%s", E.TENCENT_CDN, key)
}
