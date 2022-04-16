package main

import (
	"net"
	"os"
	"runtime/trace"

	. "github.com/TENX-S/backend/common"
	"github.com/TENX-S/backend/model"
	. "github.com/TENX-S/backend/service"
	. "github.com/TENX-S/backend/service/proto"
	_ "github.com/go-sql-driver/mysql"
	"google.golang.org/grpc"
)

func main() {
	f, err := os.Create("trace.out")
	ERR(err)
	defer f.Close()

	err = trace.Start(f)
	ERR(err)
	defer trace.Stop()

	model.InitModel()
	s := grpc.NewServer()
	conn, err := net.Listen("tcp", E.LISTEN_ADDR)
	ERR(err)
	RegisterAuthenticateServer(s, &AuthService{})
	RegisterPostServer(s, &PostService{})
	ERR(s.Serve(conn))
}
