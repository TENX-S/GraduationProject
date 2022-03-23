package model

import (
	"database/sql"
	"fmt"
	"os"
	"path/filepath"
	str "strings"

	. "github.com/TENX-S/backend/common"
	"github.com/go-redis/redis/v8"
	"github.com/google/uuid"
	qrcode "github.com/skip2/go-qrcode"
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

func (p *Post) GenQrCode() (err error) {
	var png []byte
	png, err = qrcode.Encode(p.Id.String(), qrcode.Highest, 512)
	if err != nil {
		return
	}
	f, err := os.OpenFile(filepath.Join("qrcodes", fmt.Sprintf("%s.png", p.Name)), os.O_CREATE|os.O_TRUNC|os.O_WRONLY, 0644)
	if err != nil {
		return
	}
	_, err = f.Write(png)
	if err != nil {
		return
	}
	return
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
