package common

import (
	"os"

	"github.com/sirupsen/logrus"
)

var L = logrus.New()

func init() {
	L.SetLevel(logrus.InfoLevel)
	L.Out = os.Stdout
}
