package model

import (
	"crypto/sha256"
	"database/sql"
	"fmt"

	. "github.com/TENX-S/backend/common"
)

const (
	SUCCESS = iota
	MISMATCHED_PASSWORD
	NONEXISTENT_USER
	NONEXISTENT_POST
	INVALID_POST_ID
	DUPLICATED_NAME
	UNKNOWN
)

type User struct {
	Email    string `db:"email"`
	PswdHash string `db:"pswdhash"`
}

func getHash(pswd string) string {
	return fmt.Sprintf("%x", sha256.Sum256([]byte(pswd+E.PSWD_SALT)))
}

func (u *User) New(email, pswd string) {
	u.Email = email
	u.PswdHash = getHash(pswd)
}

func (u *User) Login(email, pswd string) (res int) {
	tx := DB.MustBegin()
	err := tx.Get(u, QueryUser, email)
	if err == sql.ErrNoRows {
		res = NONEXISTENT_USER
		return
	}
	WTF(err)
	WTF(tx.Commit())
	if getHash(pswd) == u.PswdHash {
		return
	} else {
		res = MISMATCHED_PASSWORD
		return
	}
}

func (u *User) SignUp(email, pswd string) (res int) {
	u.New(email, pswd)
	tx := DB.MustBegin()
	_, err := tx.NamedExec(SignUpUser, u)
	WTF(tx.Commit())
	if GetSqlErrNum(err) == 1062 {
		res = DUPLICATED_NAME
		return
	}
	WTF(err)
	return
}
