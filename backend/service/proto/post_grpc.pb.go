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

// PostClient is the client API for Post service.
//
// For semantics around ctx use and closing/ending streaming RPCs, please refer to https://pkg.go.dev/google.golang.org/grpc/?tab=doc#ClientConn.NewStream.
type PostClient interface {
	OnQuery(ctx context.Context, in *PostRequest, opts ...grpc.CallOption) (*PostReply, error)
	OnFetchAll(ctx context.Context, in *Empty, opts ...grpc.CallOption) (*Posts, error)
	OnSearch(ctx context.Context, in *Token, opts ...grpc.CallOption) (*Posts, error)
}

type postClient struct {
	cc grpc.ClientConnInterface
}

func NewPostClient(cc grpc.ClientConnInterface) PostClient {
	return &postClient{cc}
}

func (c *postClient) OnQuery(ctx context.Context, in *PostRequest, opts ...grpc.CallOption) (*PostReply, error) {
	out := new(PostReply)
	err := c.cc.Invoke(ctx, "/z.museum.post.Post/OnQuery", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *postClient) OnFetchAll(ctx context.Context, in *Empty, opts ...grpc.CallOption) (*Posts, error) {
	out := new(Posts)
	err := c.cc.Invoke(ctx, "/z.museum.post.Post/OnFetchAll", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

func (c *postClient) OnSearch(ctx context.Context, in *Token, opts ...grpc.CallOption) (*Posts, error) {
	out := new(Posts)
	err := c.cc.Invoke(ctx, "/z.museum.post.Post/OnSearch", in, out, opts...)
	if err != nil {
		return nil, err
	}
	return out, nil
}

// PostServer is the server API for Post service.
// All implementations must embed UnimplementedPostServer
// for forward compatibility
type PostServer interface {
	OnQuery(context.Context, *PostRequest) (*PostReply, error)
	OnFetchAll(context.Context, *Empty) (*Posts, error)
	OnSearch(context.Context, *Token) (*Posts, error)
	mustEmbedUnimplementedPostServer()
}

// UnimplementedPostServer must be embedded to have forward compatible implementations.
type UnimplementedPostServer struct {
}

func (UnimplementedPostServer) OnQuery(context.Context, *PostRequest) (*PostReply, error) {
	return nil, status.Errorf(codes.Unimplemented, "method OnQuery not implemented")
}
func (UnimplementedPostServer) OnFetchAll(context.Context, *Empty) (*Posts, error) {
	return nil, status.Errorf(codes.Unimplemented, "method OnFetchAll not implemented")
}
func (UnimplementedPostServer) OnSearch(context.Context, *Token) (*Posts, error) {
	return nil, status.Errorf(codes.Unimplemented, "method OnSearch not implemented")
}
func (UnimplementedPostServer) mustEmbedUnimplementedPostServer() {}

// UnsafePostServer may be embedded to opt out of forward compatibility for this service.
// Use of this interface is not recommended, as added methods to PostServer will
// result in compilation errors.
type UnsafePostServer interface {
	mustEmbedUnimplementedPostServer()
}

func RegisterPostServer(s grpc.ServiceRegistrar, srv PostServer) {
	s.RegisterService(&Post_ServiceDesc, srv)
}

func _Post_OnQuery_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(PostRequest)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PostServer).OnQuery(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/z.museum.post.Post/OnQuery",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PostServer).OnQuery(ctx, req.(*PostRequest))
	}
	return interceptor(ctx, in, info, handler)
}

func _Post_OnFetchAll_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Empty)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PostServer).OnFetchAll(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/z.museum.post.Post/OnFetchAll",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PostServer).OnFetchAll(ctx, req.(*Empty))
	}
	return interceptor(ctx, in, info, handler)
}

func _Post_OnSearch_Handler(srv interface{}, ctx context.Context, dec func(interface{}) error, interceptor grpc.UnaryServerInterceptor) (interface{}, error) {
	in := new(Token)
	if err := dec(in); err != nil {
		return nil, err
	}
	if interceptor == nil {
		return srv.(PostServer).OnSearch(ctx, in)
	}
	info := &grpc.UnaryServerInfo{
		Server:     srv,
		FullMethod: "/z.museum.post.Post/OnSearch",
	}
	handler := func(ctx context.Context, req interface{}) (interface{}, error) {
		return srv.(PostServer).OnSearch(ctx, req.(*Token))
	}
	return interceptor(ctx, in, info, handler)
}

// Post_ServiceDesc is the grpc.ServiceDesc for Post service.
// It's only intended for direct use with grpc.RegisterService,
// and not to be introspected or modified (even as a copy)
var Post_ServiceDesc = grpc.ServiceDesc{
	ServiceName: "z.museum.post.Post",
	HandlerType: (*PostServer)(nil),
	Methods: []grpc.MethodDesc{
		{
			MethodName: "OnQuery",
			Handler:    _Post_OnQuery_Handler,
		},
		{
			MethodName: "OnFetchAll",
			Handler:    _Post_OnFetchAll_Handler,
		},
		{
			MethodName: "OnSearch",
			Handler:    _Post_OnSearch_Handler,
		},
	},
	Streams:  []grpc.StreamDesc{},
	Metadata: "service/proto/post.proto",
}
