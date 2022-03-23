package common

import (
	"os"

	"github.com/sirupsen/logrus"
)

var Logger = logrus.New()

func init() {
	Logger.SetLevel(logrus.InfoLevel)
	Logger.Out = os.Stdout
	Logger.Info("Hi, there")
}
