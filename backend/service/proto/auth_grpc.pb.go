// Code generated by protoc-gen-go-grpc. DO NOT EDIT.

package proto

import (
	context "context"
	grpc "google.golang.org/grpc"
	codes "google.golang.org/grpc/codes"
	status "google.golang.org/grpc/status"
)

// This is a compile-time assertion to ensure that this generated file
// is compatible with the grpc package it is being compiled against.
// Requires gRPC-Go v1.32.0 or later.
const _ = grpc.SupportPackageIsVersion7

// AuthenticateClient is the client API for Authenticate service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type AuthenticateClient interface {
	OnLogin(ctx context.Context, in *AuthRequest, opts ...grpc.CallOption) (*AuthReply, error)
	OnSignUp(ctx context.Context, in *AuthRequest, opts ...grpc.CallOption) (*AuthReply, error)
}

type authenticateClient struct {
	cc grpc.ClientConnInterface
}

func NewAuthenticateClient(cc grpc.ClientConnInterface) AuthenticateClient {
	return &authenticateClient{cc}
}

func (c *authenticateClient) OnLogin(ctx context.Context, in *AuthRequest, opts ...grpc.CallOption) (*AuthReply, error) {
	out := new(AuthReply)
	err := c.cc.Invoke(ctx, "/z.museum.auth.Authenticate/OnLogin", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *authenticateClient) OnSignUp(ctx context.Context, in *AuthRequest, opts ...grpc.CallOption) (*AuthReply, error) {
	out := new(AuthReply)
	err := c.cc.Invoke(ctx, "/z.museum.auth.Authenticate/OnSignUp", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// AuthenticateServer is the server API for Authenticate service.
// All implementations must embed UnimplementedAuthenticateServer
// for forward compatibility
type AuthenticateServer interface {
	OnLogin(context.Context, *AuthRequest) (*AuthReply, error)
	OnSignUp(context.Context, *AuthRequest) (*AuthReply, error)
	mustEmbedUnimplementedAuthenticateServer()
}

// UnimplementedAuthenticateServer must be embedded to have forward compatible implementations.
type UnimplementedAuthenticateServer struct {
}

func (UnimplementedAuthenticateServer) OnLogin(context.Context, *AuthRequest) (*AuthReply, error) {
	return nil, status.Errorf(codes.Unimplemented, "method OnLogin not implemented")
}
func (UnimplementedAuthenticateServer) OnSignUp(context.Context, *AuthRequest) (*AuthReply, error) {
	return nil, status.Errorf(codes.Unimplemented, "method OnSignUp not implemented")
}
func (UnimplementedAuthenticateServer) mustEmbedUnimplementedAuthenticateServer() {}

// UnsafeAuthenticateServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to AuthenticateServer will
// result in compilation errors.
type UnsafeAuthenticateServer interface {
	mustEmbedUnimplementedAuthenticateServer()
}

func RegisterAuthenticateServer(s grpc.ServiceRegistrar, srv AuthenticateServer) {
	s.RegisterService(&Authenticate_ServiceDesc, srv)
}

func _Authenticate_OnLogin_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(AuthRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthenticateServer).OnLogin(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/z.museum.auth.Authenticate/OnLogin",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthenticateServer).OnLogin(ctx, req.(*AuthRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Authenticate_OnSignUp_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(AuthRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(AuthenticateServer).OnSignUp(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/z.museum.auth.Authenticate/OnSignUp",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(AuthenticateServer).OnSignUp(ctx, req.(*AuthRequest))
	}
	return interceptor(ctx, in, info, handler)
}

// Authenticate_ServiceDesc is the grpc.ServiceDesc for Authenticate service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var Authenticate_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "z.museum.auth.Authenticate",
	HandlerType: (*AuthenticateServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "OnLogin",
			Handler:    _Authenticate_OnLogin_Handler,
		},
		{
			MethodName: "OnSignUp",
			Handler:    _Authenticate_OnSignUp_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "service/proto/auth.proto",
}
