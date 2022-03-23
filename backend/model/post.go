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

func (p *Post) GenQrCode() {
	defer QRW.Done()
	png, err := qrcode.Encode(p.Id.String(), qrcode.Highest, 512)
	EC <- err

	key := fmt.Sprintf("qrcode/%s.png", p.Name)
	Logger.Printf("[POST] [UPLOADING:%s:%s]", p.Name, p.Id)
	var res *cos.Response
	res, err = COS_CLIENT.Object.Put(context.Background(), key, bytes.NewReader(png), nil)
	EC <- err
	if res.StatusCode != 200 {
		EC <- fmt.Errorf("[POST] [UPLOAD:FAILED:%s:%s]", p.Name, p.Id)
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
		arr := str.Split(val, "|")
		if len(arr) != 5 {
			panic("oh blooding hell")
		}

		p.Name = arr[0]
		p.Dynasty = arr[1]
		p.Descr = arr[2]
		p.Intro = arr[3]
		p.Pic = arr[4]
		return
	} else {
		res = UNKNOWN
		WTF(err)
		return
	}
}
