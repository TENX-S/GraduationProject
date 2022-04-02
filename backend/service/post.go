package service

import (
	"context"
	"fmt"

	. "github.com/TENX-S/backend/common"
	. "github.com/TENX-S/backend/model"
	. "github.com/TENX-S/backend/service/proto"
)

type PostService struct {
	UnimplementedPostServer
}

func (s *PostService) OnQuery(ctx context.Context, in *PostRequest) (*PostReply, error) {
	var p Post
	err := PostError_UNKNOWN
	reply := &PostReply{Success: false, Content: nil, Error: &err}
	res := p.Query(in.Id)

	switch res {
	case SUCCESS:
		L.Printf("[POST:QUERY] [SUCCESS:%s]", in.Id)
		reply = &PostReply{Success: true, Content: &PostContent{Id: p.Id.String(), Name: p.Name, Dynasty: p.Dynasty, Descr: p.Descr, Intro: p.Intro, Pic: p.Pic}, Error: nil}
		return reply, nil
	case NONEXISTENT_POST:
		L.Printf("[POST:QUERY] [FAIL:NONEXISTENT_POST:%s]", in.Id)
		err = PostError_NONEXISTENT_POST
		reply = &PostReply{Success: false, Content: nil, Error: &err}
		return reply, nil
	case INVALID_POST_ID:
		L.Printf("[POST:QUERY] [FAIL:INVALID_POST_ID:%s]", in.Id)
		err = PostError_INVALID_POST_ID
		reply = &PostReply{Success: false, Content: nil, Error: &err}
		return reply, nil
	}

	L.Fatal(fmt.Sprintf("[POST:QUERY] [FATAL:%s] [RES:%d]", in.Id, res))
	return reply, nil
}

func (s *PostService) OnFetchAll(ctx context.Context, in *Empty) (*Posts, error) {
	var posts []*PostReply

	for _, p := range FetchAll() {
		posts = append(posts, &PostReply{Success: true, Content: &PostContent{Id: p.Id.String(), Name: p.Name, Dynasty: p.Dynasty, Descr: p.Descr, Intro: p.Intro, Pic: p.Pic}, Error: nil})
	}
	L.Printf("[POST:FETCH_ALL] [SUCCESS:%d posts]", len(posts))
	return &Posts{Posts: posts}, nil
}

func (s *PostService) OnSearch(ctx context.Context, in *Token) (*Posts, error) {
	var posts []*PostReply
	for _, p := range Search(in.Value) {
		posts = append(posts, &PostReply{Success: true, Content: &PostContent{Id: p.Id.String(), Name: p.Name, Dynasty: p.Dynasty, Descr: p.Descr, Intro: p.Intro, Pic: p.Pic}, Error: nil})
	}
	L.Printf("[POST:SEARCH] [TOKEN:%s] [SUCCESS:%d posts]", in.Value, len(posts))
	return &Posts{Posts: posts}, nil
}
