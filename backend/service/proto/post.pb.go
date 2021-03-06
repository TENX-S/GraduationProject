// Code generated by protoc-gen-go. DO NOT EDIT.
// versions:
// 	protoc-gen-go v1.26.0
// 	protoc        v3.19.4
// source: service/proto/post.proto

package proto

import (
	protoreflect "google.golang.org/protobuf/reflect/protoreflect"
	protoimpl "google.golang.org/protobuf/runtime/protoimpl"
	reflect "reflect"
	sync "sync"
)

const (
	// Verify that this generated code is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(20 - protoimpl.MinVersion)
	// Verify that runtime/protoimpl is sufficiently up-to-date.
	_ = protoimpl.EnforceVersion(protoimpl.MaxVersion - 20)
)

type PostError int32

const (
	PostError_NONEXISTENT_POST PostError = 0
	PostError_INVALID_POST_ID  PostError = 1
	PostError_UNKNOWN          PostError = 2
)

// Enum value maps for PostError.
var (
	PostError_name = map[int32]string{
		0: "NONEXISTENT_POST",
		1: "INVALID_POST_ID",
		2: "UNKNOWN",
	}
	PostError_value = map[string]int32{
		"NONEXISTENT_POST": 0,
		"INVALID_POST_ID":  1,
		"UNKNOWN":          2,
	}
)

func (x PostError) Enum() *PostError {
	p := new(PostError)
	*p = x
	return p
}

func (x PostError) String() string {
	return protoimpl.X.EnumStringOf(x.Descriptor(), protoreflect.EnumNumber(x))
}

func (PostError) Descriptor() protoreflect.EnumDescriptor {
	return file_service_proto_post_proto_enumTypes[0].Descriptor()
}

func (PostError) Type() protoreflect.EnumType {
	return &file_service_proto_post_proto_enumTypes[0]
}

func (x PostError) Number() protoreflect.EnumNumber {
	return protoreflect.EnumNumber(x)
}

// Deprecated: Use PostError.Descriptor instead.
func (PostError) EnumDescriptor() ([]byte, []int) {
	return file_service_proto_post_proto_rawDescGZIP(), []int{0}
}

type PostRequest struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
}

func (x *PostRequest) Reset() {
	*x = PostRequest{}
	if protoimpl.UnsafeEnabled {
		mi := &file_service_proto_post_proto_msgTypes[0]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PostRequest) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PostRequest) ProtoMessage() {}

func (x *PostRequest) ProtoReflect() protoreflect.Message {
	mi := &file_service_proto_post_proto_msgTypes[0]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PostRequest.ProtoReflect.Descriptor instead.
func (*PostRequest) Descriptor() ([]byte, []int) {
	return file_service_proto_post_proto_rawDescGZIP(), []int{0}
}

func (x *PostRequest) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

type Empty struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields
}

func (x *Empty) Reset() {
	*x = Empty{}
	if protoimpl.UnsafeEnabled {
		mi := &file_service_proto_post_proto_msgTypes[1]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Empty) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Empty) ProtoMessage() {}

func (x *Empty) ProtoReflect() protoreflect.Message {
	mi := &file_service_proto_post_proto_msgTypes[1]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Empty.ProtoReflect.Descriptor instead.
func (*Empty) Descriptor() ([]byte, []int) {
	return file_service_proto_post_proto_rawDescGZIP(), []int{1}
}

type Token struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Value string `protobuf:"bytes,1,opt,name=value,proto3" json:"value,omitempty"`
}

func (x *Token) Reset() {
	*x = Token{}
	if protoimpl.UnsafeEnabled {
		mi := &file_service_proto_post_proto_msgTypes[2]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Token) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Token) ProtoMessage() {}

func (x *Token) ProtoReflect() protoreflect.Message {
	mi := &file_service_proto_post_proto_msgTypes[2]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Token.ProtoReflect.Descriptor instead.
func (*Token) Descriptor() ([]byte, []int) {
	return file_service_proto_post_proto_rawDescGZIP(), []int{2}
}

func (x *Token) GetValue() string {
	if x != nil {
		return x.Value
	}
	return ""
}

type Posts struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Posts []*PostReply `protobuf:"bytes,1,rep,name=posts,proto3" json:"posts,omitempty"`
}

func (x *Posts) Reset() {
	*x = Posts{}
	if protoimpl.UnsafeEnabled {
		mi := &file_service_proto_post_proto_msgTypes[3]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *Posts) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*Posts) ProtoMessage() {}

func (x *Posts) ProtoReflect() protoreflect.Message {
	mi := &file_service_proto_post_proto_msgTypes[3]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use Posts.ProtoReflect.Descriptor instead.
func (*Posts) Descriptor() ([]byte, []int) {
	return file_service_proto_post_proto_rawDescGZIP(), []int{3}
}

func (x *Posts) GetPosts() []*PostReply {
	if x != nil {
		return x.Posts
	}
	return nil
}

type PostReply struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Success bool         `protobuf:"varint,1,opt,name=success,proto3" json:"success,omitempty"`
	Content *PostContent `protobuf:"bytes,2,opt,name=content,proto3,oneof" json:"content,omitempty"`
	Error   *PostError   `protobuf:"varint,3,opt,name=error,proto3,enum=z.museum.post.PostError,oneof" json:"error,omitempty"`
}

func (x *PostReply) Reset() {
	*x = PostReply{}
	if protoimpl.UnsafeEnabled {
		mi := &file_service_proto_post_proto_msgTypes[4]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PostReply) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PostReply) ProtoMessage() {}

func (x *PostReply) ProtoReflect() protoreflect.Message {
	mi := &file_service_proto_post_proto_msgTypes[4]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PostReply.ProtoReflect.Descriptor instead.
func (*PostReply) Descriptor() ([]byte, []int) {
	return file_service_proto_post_proto_rawDescGZIP(), []int{4}
}

func (x *PostReply) GetSuccess() bool {
	if x != nil {
		return x.Success
	}
	return false
}

func (x *PostReply) GetContent() *PostContent {
	if x != nil {
		return x.Content
	}
	return nil
}

func (x *PostReply) GetError() PostError {
	if x != nil && x.Error != nil {
		return *x.Error
	}
	return PostError_NONEXISTENT_POST
}

type PostContent struct {
	state         protoimpl.MessageState
	sizeCache     protoimpl.SizeCache
	unknownFields protoimpl.UnknownFields

	Id      string `protobuf:"bytes,1,opt,name=id,proto3" json:"id,omitempty"`
	Name    string `protobuf:"bytes,2,opt,name=name,proto3" json:"name,omitempty"`
	Dynasty string `protobuf:"bytes,3,opt,name=dynasty,proto3" json:"dynasty,omitempty"`
	Descr   string `protobuf:"bytes,4,opt,name=descr,proto3" json:"descr,omitempty"`
	Intro   string `protobuf:"bytes,5,opt,name=intro,proto3" json:"intro,omitempty"`
	Pic     string `protobuf:"bytes,6,opt,name=pic,proto3" json:"pic,omitempty"`
}

func (x *PostContent) Reset() {
	*x = PostContent{}
	if protoimpl.UnsafeEnabled {
		mi := &file_service_proto_post_proto_msgTypes[5]
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		ms.StoreMessageInfo(mi)
	}
}

func (x *PostContent) String() string {
	return protoimpl.X.MessageStringOf(x)
}

func (*PostContent) ProtoMessage() {}

func (x *PostContent) ProtoReflect() protoreflect.Message {
	mi := &file_service_proto_post_proto_msgTypes[5]
	if protoimpl.UnsafeEnabled && x != nil {
		ms := protoimpl.X.MessageStateOf(protoimpl.Pointer(x))
		if ms.LoadMessageInfo() == nil {
			ms.StoreMessageInfo(mi)
		}
		return ms
	}
	return mi.MessageOf(x)
}

// Deprecated: Use PostContent.ProtoReflect.Descriptor instead.
func (*PostContent) Descriptor() ([]byte, []int) {
	return file_service_proto_post_proto_rawDescGZIP(), []int{5}
}

func (x *PostContent) GetId() string {
	if x != nil {
		return x.Id
	}
	return ""
}

func (x *PostContent) GetName() string {
	if x != nil {
		return x.Name
	}
	return ""
}

func (x *PostContent) GetDynasty() string {
	if x != nil {
		return x.Dynasty
	}
	return ""
}

func (x *PostContent) GetDescr() string {
	if x != nil {
		return x.Descr
	}
	return ""
}

func (x *PostContent) GetIntro() string {
	if x != nil {
		return x.Intro
	}
	return ""
}

func (x *PostContent) GetPic() string {
	if x != nil {
		return x.Pic
	}
	return ""
}

var File_service_proto_post_proto protoreflect.FileDescriptor

var file_service_proto_post_proto_rawDesc = []byte{
	0x0a, 0x18, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2f, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x2f,
	0x70, 0x6f, 0x73, 0x74, 0x2e, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x12, 0x0d, 0x7a, 0x2e, 0x6d, 0x75,
	0x73, 0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f, 0x73, 0x74, 0x22, 0x1d, 0x0a, 0x0b, 0x50, 0x6f, 0x73,
	0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x22, 0x07, 0x0a, 0x05, 0x45, 0x6d, 0x70, 0x74,
	0x79, 0x22, 0x1d, 0x0a, 0x05, 0x54, 0x6f, 0x6b, 0x65, 0x6e, 0x12, 0x14, 0x0a, 0x05, 0x76, 0x61,
	0x6c, 0x75, 0x65, 0x18, 0x01, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x76, 0x61, 0x6c, 0x75, 0x65,
	0x22, 0x37, 0x0a, 0x05, 0x50, 0x6f, 0x73, 0x74, 0x73, 0x12, 0x2e, 0x0a, 0x05, 0x70, 0x6f, 0x73,
	0x74, 0x73, 0x18, 0x01, 0x20, 0x03, 0x28, 0x0b, 0x32, 0x18, 0x2e, 0x7a, 0x2e, 0x6d, 0x75, 0x73,
	0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f, 0x73, 0x74, 0x2e, 0x50, 0x6f, 0x73, 0x74, 0x52, 0x65, 0x70,
	0x6c, 0x79, 0x52, 0x05, 0x70, 0x6f, 0x73, 0x74, 0x73, 0x22, 0xab, 0x01, 0x0a, 0x09, 0x50, 0x6f,
	0x73, 0x74, 0x52, 0x65, 0x70, 0x6c, 0x79, 0x12, 0x18, 0x0a, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65,
	0x73, 0x73, 0x18, 0x01, 0x20, 0x01, 0x28, 0x08, 0x52, 0x07, 0x73, 0x75, 0x63, 0x63, 0x65, 0x73,
	0x73, 0x12, 0x39, 0x0a, 0x07, 0x63, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x18, 0x02, 0x20, 0x01,
	0x28, 0x0b, 0x32, 0x1a, 0x2e, 0x7a, 0x2e, 0x6d, 0x75, 0x73, 0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f,
	0x73, 0x74, 0x2e, 0x50, 0x6f, 0x73, 0x74, 0x43, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x48, 0x00,
	0x52, 0x07, 0x63, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x88, 0x01, 0x01, 0x12, 0x33, 0x0a, 0x05,
	0x65, 0x72, 0x72, 0x6f, 0x72, 0x18, 0x03, 0x20, 0x01, 0x28, 0x0e, 0x32, 0x18, 0x2e, 0x7a, 0x2e,
	0x6d, 0x75, 0x73, 0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f, 0x73, 0x74, 0x2e, 0x50, 0x6f, 0x73, 0x74,
	0x45, 0x72, 0x72, 0x6f, 0x72, 0x48, 0x01, 0x52, 0x05, 0x65, 0x72, 0x72, 0x6f, 0x72, 0x88, 0x01,
	0x01, 0x42, 0x0a, 0x0a, 0x08, 0x5f, 0x63, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x42, 0x08, 0x0a,
	0x06, 0x5f, 0x65, 0x72, 0x72, 0x6f, 0x72, 0x22, 0x89, 0x01, 0x0a, 0x0b, 0x50, 0x6f, 0x73, 0x74,
	0x43, 0x6f, 0x6e, 0x74, 0x65, 0x6e, 0x74, 0x12, 0x0e, 0x0a, 0x02, 0x69, 0x64, 0x18, 0x01, 0x20,
	0x01, 0x28, 0x09, 0x52, 0x02, 0x69, 0x64, 0x12, 0x12, 0x0a, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x18,
	0x02, 0x20, 0x01, 0x28, 0x09, 0x52, 0x04, 0x6e, 0x61, 0x6d, 0x65, 0x12, 0x18, 0x0a, 0x07, 0x64,
	0x79, 0x6e, 0x61, 0x73, 0x74, 0x79, 0x18, 0x03, 0x20, 0x01, 0x28, 0x09, 0x52, 0x07, 0x64, 0x79,
	0x6e, 0x61, 0x73, 0x74, 0x79, 0x12, 0x14, 0x0a, 0x05, 0x64, 0x65, 0x73, 0x63, 0x72, 0x18, 0x04,
	0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x64, 0x65, 0x73, 0x63, 0x72, 0x12, 0x14, 0x0a, 0x05, 0x69,
	0x6e, 0x74, 0x72, 0x6f, 0x18, 0x05, 0x20, 0x01, 0x28, 0x09, 0x52, 0x05, 0x69, 0x6e, 0x74, 0x72,
	0x6f, 0x12, 0x10, 0x0a, 0x03, 0x70, 0x69, 0x63, 0x18, 0x06, 0x20, 0x01, 0x28, 0x09, 0x52, 0x03,
	0x70, 0x69, 0x63, 0x2a, 0x43, 0x0a, 0x09, 0x50, 0x6f, 0x73, 0x74, 0x45, 0x72, 0x72, 0x6f, 0x72,
	0x12, 0x14, 0x0a, 0x10, 0x4e, 0x4f, 0x4e, 0x45, 0x58, 0x49, 0x53, 0x54, 0x45, 0x4e, 0x54, 0x5f,
	0x50, 0x4f, 0x53, 0x54, 0x10, 0x00, 0x12, 0x13, 0x0a, 0x0f, 0x49, 0x4e, 0x56, 0x41, 0x4c, 0x49,
	0x44, 0x5f, 0x50, 0x4f, 0x53, 0x54, 0x5f, 0x49, 0x44, 0x10, 0x01, 0x12, 0x0b, 0x0a, 0x07, 0x55,
	0x4e, 0x4b, 0x4e, 0x4f, 0x57, 0x4e, 0x10, 0x02, 0x32, 0xbf, 0x01, 0x0a, 0x04, 0x50, 0x6f, 0x73,
	0x74, 0x12, 0x41, 0x0a, 0x07, 0x4f, 0x6e, 0x51, 0x75, 0x65, 0x72, 0x79, 0x12, 0x1a, 0x2e, 0x7a,
	0x2e, 0x6d, 0x75, 0x73, 0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f, 0x73, 0x74, 0x2e, 0x50, 0x6f, 0x73,
	0x74, 0x52, 0x65, 0x71, 0x75, 0x65, 0x73, 0x74, 0x1a, 0x18, 0x2e, 0x7a, 0x2e, 0x6d, 0x75, 0x73,
	0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f, 0x73, 0x74, 0x2e, 0x50, 0x6f, 0x73, 0x74, 0x52, 0x65, 0x70,
	0x6c, 0x79, 0x22, 0x00, 0x12, 0x3a, 0x0a, 0x0a, 0x4f, 0x6e, 0x46, 0x65, 0x74, 0x63, 0x68, 0x41,
	0x6c, 0x6c, 0x12, 0x14, 0x2e, 0x7a, 0x2e, 0x6d, 0x75, 0x73, 0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f,
	0x73, 0x74, 0x2e, 0x45, 0x6d, 0x70, 0x74, 0x79, 0x1a, 0x14, 0x2e, 0x7a, 0x2e, 0x6d, 0x75, 0x73,
	0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f, 0x73, 0x74, 0x2e, 0x50, 0x6f, 0x73, 0x74, 0x73, 0x22, 0x00,
	0x12, 0x38, 0x0a, 0x08, 0x4f, 0x6e, 0x53, 0x65, 0x61, 0x72, 0x63, 0x68, 0x12, 0x14, 0x2e, 0x7a,
	0x2e, 0x6d, 0x75, 0x73, 0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f, 0x73, 0x74, 0x2e, 0x54, 0x6f, 0x6b,
	0x65, 0x6e, 0x1a, 0x14, 0x2e, 0x7a, 0x2e, 0x6d, 0x75, 0x73, 0x65, 0x75, 0x6d, 0x2e, 0x70, 0x6f,
	0x73, 0x74, 0x2e, 0x50, 0x6f, 0x73, 0x74, 0x73, 0x22, 0x00, 0x42, 0x29, 0x5a, 0x27, 0x67, 0x69,
	0x74, 0x68, 0x75, 0x62, 0x2e, 0x63, 0x6f, 0x6d, 0x2f, 0x54, 0x45, 0x4e, 0x58, 0x2d, 0x53, 0x2f,
	0x62, 0x61, 0x63, 0x6b, 0x65, 0x6e, 0x64, 0x2f, 0x73, 0x65, 0x72, 0x76, 0x69, 0x63, 0x65, 0x2f,
	0x70, 0x72, 0x6f, 0x74, 0x6f, 0x62, 0x06, 0x70, 0x72, 0x6f, 0x74, 0x6f, 0x33,
}

var (
	file_service_proto_post_proto_rawDescOnce sync.Once
	file_service_proto_post_proto_rawDescData = file_service_proto_post_proto_rawDesc
)

func file_service_proto_post_proto_rawDescGZIP() []byte {
	file_service_proto_post_proto_rawDescOnce.Do(func() {
		file_service_proto_post_proto_rawDescData = protoimpl.X.CompressGZIP(file_service_proto_post_proto_rawDescData)
	})
	return file_service_proto_post_proto_rawDescData
}

var file_service_proto_post_proto_enumTypes = make([]protoimpl.EnumInfo, 1)
var file_service_proto_post_proto_msgTypes = make([]protoimpl.MessageInfo, 6)
var file_service_proto_post_proto_goTypes = []interface{}{
	(PostError)(0),      // 0: z.museum.post.PostError
	(*PostRequest)(nil), // 1: z.museum.post.PostRequest
	(*Empty)(nil),       // 2: z.museum.post.Empty
	(*Token)(nil),       // 3: z.museum.post.Token
	(*Posts)(nil),       // 4: z.museum.post.Posts
	(*PostReply)(nil),   // 5: z.museum.post.PostReply
	(*PostContent)(nil), // 6: z.museum.post.PostContent
}
var file_service_proto_post_proto_depIdxs = []int32{
	5, // 0: z.museum.post.Posts.posts:type_name -> z.museum.post.PostReply
	6, // 1: z.museum.post.PostReply.content:type_name -> z.museum.post.PostContent
	0, // 2: z.museum.post.PostReply.error:type_name -> z.museum.post.PostError
	1, // 3: z.museum.post.Post.OnQuery:input_type -> z.museum.post.PostRequest
	2, // 4: z.museum.post.Post.OnFetchAll:input_type -> z.museum.post.Empty
	3, // 5: z.museum.post.Post.OnSearch:input_type -> z.museum.post.Token
	5, // 6: z.museum.post.Post.OnQuery:output_type -> z.museum.post.PostReply
	4, // 7: z.museum.post.Post.OnFetchAll:output_type -> z.museum.post.Posts
	4, // 8: z.museum.post.Post.OnSearch:output_type -> z.museum.post.Posts
	6, // [6:9] is the sub-list for method output_type
	3, // [3:6] is the sub-list for method input_type
	3, // [3:3] is the sub-list for extension type_name
	3, // [3:3] is the sub-list for extension extendee
	0, // [0:3] is the sub-list for field type_name
}

func init() { file_service_proto_post_proto_init() }
func file_service_proto_post_proto_init() {
	if File_service_proto_post_proto != nil {
		return
	}
	if !protoimpl.UnsafeEnabled {
		file_service_proto_post_proto_msgTypes[0].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PostRequest); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_service_proto_post_proto_msgTypes[1].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Empty); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_service_proto_post_proto_msgTypes[2].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Token); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_service_proto_post_proto_msgTypes[3].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*Posts); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_service_proto_post_proto_msgTypes[4].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PostReply); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
		file_service_proto_post_proto_msgTypes[5].Exporter = func(v interface{}, i int) interface{} {
			switch v := v.(*PostContent); i {
			case 0:
				return &v.state
			case 1:
				return &v.sizeCache
			case 2:
				return &v.unknownFields
			default:
				return nil
			}
		}
	}
	file_service_proto_post_proto_msgTypes[4].OneofWrappers = []interface{}{}
	type x struct{}
	out := protoimpl.TypeBuilder{
		File: protoimpl.DescBuilder{
			GoPackagePath: reflect.TypeOf(x{}).PkgPath(),
			RawDescriptor: file_service_proto_post_proto_rawDesc,
			NumEnums:      1,
			NumMessages:   6,
			NumExtensions: 0,
			NumServices:   1,
		},
		GoTypes:           file_service_proto_post_proto_goTypes,
		DependencyIndexes: file_service_proto_post_proto_depIdxs,
		EnumInfos:         file_service_proto_post_proto_enumTypes,
		MessageInfos:      file_service_proto_post_proto_msgTypes,
	}.Build()
	File_service_proto_post_proto = out.File
	file_service_proto_post_proto_rawDesc = nil
	file_service_proto_post_proto_goTypes = nil
	file_service_proto_post_proto_depIdxs = nil
}
