package model

import (
	"bytes"
	"context"
	"database/sql"
	"fmt"
	str "strings"

	. "github.com/TENX-S/backend/common"
	"github.com/go-redis/redis/v8"
	"github.com/google/uuid"
	qrcode "github.com/skip2/go-qrcode"
	"github.com/tencentyun/cos-go-sdk-v5"
)

type Post struct {
	Id      uuid.UUID `db:"id"`
	Name    string    `db:"name"`
	Dynasty string    `db:"dynasty"`
	// connect with '-'
	Descr string `db:"descr"`
	// connect with '-'
	Intro string `db:"intro"`
	Pic   string `db:"pic"`
}

func (p *Post) PackedField() string {
	return str.Join([]string{p.Name, p.Dynasty, p.Descr, p.Intro, p.Pic}, "|")
}

func (p Post) initQRCode() {
	defer QW.Done()

	png, err := qrcode.Encode(p.Id.String(), qrcode.Highest, 512)
	EC <- err

	var res *cos.Response
	key := fmt.Sprintf("qrcode/%s.png", p.Name)
	res, err = CC.Object.Put(context.Background(), key, bytes.NewReader(png), nil)
	EC <- err
	if res.StatusCode != 200 {
		EC <- fmt.Errorf("[POST] [UPLOAD:QRCODE:FAILED:%s:%s]", p.Name, p.Id)
	} else {
		L.Printf("[POST] [UPLOAD:QRCODE:SUCCESS:%s:%s]", p.Name, p.Id.String())
	}
}

func (p *Post) Query(id string) (res int) {
	var err error
	_, err = uuid.Parse(id)
	if err != nil {
		res = INVALID_POST_ID
		return
	}
	var val string
	val, err = KV.Get(BG, id).Result()
	if err == redis.Nil {
		tx := DB.MustBegin()
		err = tx.Get(p, QueryPost, id)
		if err == nil {
			go func() {
				WTF(KV.SetNX(BG, id, p.PackedField(), 0).Err())
			}()
			return
		}
		if err == sql.ErrNoRows {
			res = NONEXISTENT_POST
			return
		} else {
			res = UNKNOWN
			WTF(err)
			return
		}
	}
	if err == nil {
		p.mapStr2Post(val)
		return
	} else {
		res = UNKNOWN
		WTF(err)
		return
	}
}

func FetchAll() []Post {
	var ids []uuid.UUID
	tx := DB.MustBegin()
	WTF(tx.Select(&ids, FetchAllPostId))
	WTF(tx.Commit())
	res, err := KV.MGet(BG, mapUUID2Str(ids)...).Result()
	posts := make([]Post, len(res))
	for i, v := range res {
		var p Post
		val := v.(string)
		p.mapStr2Post(val)
		posts[i] = p
	}
	if err == redis.Nil {
		L.Printf("[POST] [MISS:%#v]", err)
		tx = DB.MustBegin()
		WTF(tx.Select(&posts, FetchAllPosts))
		WTF(tx.Commit())
	} else {
		WTF(err)
	}
	return posts
}

func mapUUID2Str(src []uuid.UUID) []string {
	dst := make([]string, len(src))
	for i, v := range src {
		dst[i] = v.String()
	}
	return dst
}

func (p *Post) mapStr2Post(val string) {
	arr := str.Split(val, "|")
	if len(arr) != 5 {
		panic("oh blooding hell")
	}

	p.Name = arr[0]
	p.Dynasty = arr[1]
	p.Descr = arr[2]
	p.Intro = arr[3]
	p.Pic = arr[4]
}
