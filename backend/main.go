package main

import (
	"net"

	. "github.com/TENX-S/backend/common"
	"github.com/TENX-S/backend/model"
	. "github.com/TENX-S/backend/service"
	. "github.com/TENX-S/backend/service/proto"
	_ "github.com/go-sql-driver/mysql"
	"google.golang.org/grpc"
	"google.golang.org/grpc/credentials"
)

func main() {
	model.InitModel()
	creds, err := credentials.NewServerTLSFromFile(E.CERT_FILE, E.KEY_FILE)
	ERR(err)
	s := grpc.NewServer(grpc.Creds(creds))
	conn, err := net.Listen("tcp", E.LISTEN_ADDR)
	ERR(err)
	RegisterAuthenticateServer(s, &AuthService{})
	RegisterPostServer(s, &PostService{})
	ERR(s.Serve(conn))
}
