package main

import (
	"fmt"
	"os"

	"github.com/bojand/ghz/printer"
	"github.com/bojand/ghz/runner"
)

func BenchSignUp() {
	report, err := runner.Run(
		"z.museum.auth.Authenticate.OnSignUp",
		"127.0.0.1:8080",
		runner.WithProtoFile("../service/proto/auth.proto", []string{}),
		runner.WithData(FakeUsers(1)),
		runner.WithInsecure(true),
		runner.WithAsync(true),
	)

	if err != nil {
		fmt.Println(err.Error())
		os.Exit(1)
	}

	printer := printer.ReportPrinter{
		Out:    os.Stdout,
		Report: report,
	}

	printer.Print("pretty")
}

func main() {
	BenchSignUp()
}
