package main

import (
	"net"

	. "github.com/TENX-S/backend/common"
	. "github.com/TENX-S/backend/service"
	. "github.com/TENX-S/backend/service/proto"
	_ "github.com/go-sql-driver/mysql"
	"google.golang.org/grpc"
)

func main() {
	conn, err := net.Listen("tcp", E.LISTEN_ADDR)
	WTF(err)
	s := grpc.NewServer()
	RegisterAuthenticateServer(s, &AuthService{})
	RegisterPostServer(s, &PostService{})
	WTF(s.Serve(conn))
}
