package common

import (
	"fmt"
	"os"
	"path/filepath"
	"reflect"
	"runtime"
	"strings"

	"github.com/joho/godotenv"
)

type Env struct {
	DEPLOY                 string
	LISTEN_ADDR            string
	DB_NAME                string
	TEST_USER_EMAIL        string
	TEST_USER_PSWD         string
	MYSQL_HOST             string
	MYSQL_PASS             string
	MYSQL_ADDR             string
	REDIS_ADDR             string
	TENCENT_CDN            string
	TENCENT_COS_BUCKET     string
	TENCENT_COS_SECRET_ID  string
	TENCENT_COS_SECRET_KEY string
	PSWD_SALT              string
}

var E Env

func init() {
	err := godotenv.Load(filepath.Join("env", ".env"), filepath.Join("env", "sercrets.env"))
	if err != nil {
		panic(err.Error())
	}
	E.DEPLOY = os.Getenv("DEPLOY")
	E.LISTEN_ADDR = os.Getenv("LISTEN_ADDR")
	E.DB_NAME = os.Getenv("DB_NAME")
	E.TEST_USER_EMAIL = os.Getenv("TEST_USER_EMAIL")
	E.TEST_USER_PSWD = os.Getenv("TEST_USER_PSWD")
	E.MYSQL_HOST = os.Getenv("MYSQL_HOST")
	E.MYSQL_PASS = os.Getenv("MYSQL_PASS")
	switch E.DEPLOY {
	case "docker":
		E.MYSQL_ADDR = os.Getenv("MYSQL_ADDR_DOCKER")
		E.REDIS_ADDR = os.Getenv("REDIS_ADDR_DOCKER")
		break
	case "host":
		OS := runtime.GOOS
		E.MYSQL_ADDR = os.Getenv("MYSQL_ADDR_HOST")
		switch OS {
		case "windows":
			E.REDIS_ADDR = os.Getenv("REDIS_ADDR_WIN")
		case "linux":
		case "macos":
			E.REDIS_ADDR = os.Getenv("REDIS_ADDR_UNIX")
		default:
			panic(fmt.Sprintf("Unexpected OS: %s", OS))
		}
	default:
		panic(fmt.Sprintf("Unexpected DEPLOY: %s", E.DEPLOY))
	}
	E.TENCENT_CDN = os.Getenv("TENCENT_CDN")
	E.TENCENT_COS_BUCKET = os.Getenv("TENCENT_COS_BUCKET")
	E.TENCENT_COS_SECRET_ID = os.Getenv("TENCENT_COS_SECRET_ID")
	E.TENCENT_COS_SECRET_KEY = os.Getenv("TENCENT_COS_SECRET_KEY")
	E.PSWD_SALT = os.Getenv("PSWD_SALT")
	E.mustSet()
}

func (E Env) mustSet() {
	v := reflect.ValueOf(E)
	var s []string
	for i := 0; i < v.NumField(); i++ {
		e := v.Field(i).Interface().(string)
		if len(e) == 0 {
			s = append(s, v.Type().Field(i).Name)
		}
	}
	if len(s) != 0 {
		panic(fmt.Sprintf("env variable\n%s\nnot set!", strings.Join(s, "\n")))
	}
}
