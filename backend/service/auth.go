package service

import (
	"fmt"

	. "github.com/TENX-S/backend/common"
	. "github.com/TENX-S/backend/model"
	. "github.com/TENX-S/backend/service/proto"
	"golang.org/x/net/context"
)

type AuthService struct {
	UnimplementedAuthenticateServer
}

func (s *AuthService) OnLogin(ctx context.Context, in *AuthRequest) (*AuthReply, error) {
	var u User
	err := AuthError_UNKNOWN
	reply := &AuthReply{Success: false, Error: &err}
	res := u.Login(in.Name, in.Password)

	switch res {
	case SUCCESS:
		L.Printf("[AUTH:LOGIN] [SUCCESS:%s]", in.Name)
		reply = &AuthReply{Success: true, Error: nil}
		return reply, nil
	case NONEXISTENT_USER:
		L.Printf("[AUTH:LOGIN] [FAIL:NONEXISTENT_USER:%s]", in.Name)
		err = AuthError_NONEXISTENT_USER
		reply = &AuthReply{Success: false, Error: &err}
		return reply, nil
	case MISMATCHED_PASSWORD:
		L.Printf("[AUTH:LOGIN] [FAIL:MISMATCHED_PASSWORD:%s]", in.Name)
		err = AuthError_MISMATCHED_PASSWORD
		reply = &AuthReply{Success: false, Error: &err}
		return reply, nil
	}
	L.Fatal(fmt.Sprintf("[AUTH:LOGIN] [FATAL:%s] [RES:%d]", in.Name, res))
	return reply, nil
}

func (s *AuthService) OnSignUp(ctx context.Context, in *AuthRequest) (*AuthReply, error) {
	var u User
	err := AuthError_UNKNOWN
	reply := &AuthReply{Success: false, Error: &err}
	res := u.SignUp(in.Name, in.Password)

	switch res {
	case SUCCESS:
		L.Printf("[AUTH:SIGNUP] [SUCCESS:%s]", in.Name)
		reply = &AuthReply{Success: true, Error: nil}
		return reply, nil
	case DUPLICATED_NAME:
		L.Printf("[AUTH:SIGNUP] [FAIL:DUPLICATED_NAME:%s]", in.Name)
		err = AuthError_DUPLICATED_NAME
		reply = &AuthReply{Success: false, Error: &err}
		return reply, nil
	}

	L.Fatal(fmt.Sprintf("[AUTH:SIGNUP] [FATAL:%s] [RES:%d]", in.Name, res))
	return reply, nil
}
