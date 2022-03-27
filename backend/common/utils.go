package common

import (
	"fmt"
	"runtime"

	"github.com/go-sql-driver/mysql"
)

func GetSqlErrNum(err error) (num int) {
	if driverErr, ok := err.(*mysql.MySQLError); ok {
		return int(driverErr.Number)
	}
	return
}

// Hey man, what's going on here?
func WTF(err error) {
	if err != nil {
		pc, filename, line, _ := runtime.Caller(1)
		msg := fmt.Sprintf("[FATAL] [%s:%s:%d] [%v]", runtime.FuncForPC(pc).Name(), filename, line, err)
		L.Error(msg)
	}
}
