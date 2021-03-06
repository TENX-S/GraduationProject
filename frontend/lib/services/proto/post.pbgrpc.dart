///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'post.pb.dart' as $1;
export 'post.pb.dart';

class PostClient extends $grpc.Client {
  static final _$onQuery = $grpc.ClientMethod<$1.PostRequest, $1.PostReply>(
      '/z.museum.post.Post/OnQuery',
      ($1.PostRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.PostReply.fromBuffer(value));
  static final _$onFetchAll = $grpc.ClientMethod<$1.Empty, $1.Posts>(
      '/z.museum.post.Post/OnFetchAll',
      ($1.Empty value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Posts.fromBuffer(value));
  static final _$onSearch = $grpc.ClientMethod<$1.Token, $1.Posts>(
      '/z.museum.post.Post/OnSearch',
      ($1.Token value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $1.Posts.fromBuffer(value));

  PostClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.PostReply> onQuery($1.PostRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onQuery, request, options: options);
  }

  $grpc.ResponseFuture<$1.Posts> onFetchAll($1.Empty request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onFetchAll, request, options: options);
  }

  $grpc.ResponseFuture<$1.Posts> onSearch($1.Token request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onSearch, request, options: options);
  }
}

abstract class PostServiceBase extends $grpc.Service {
  $core.String get $name => 'z.museum.post.Post';

  PostServiceBase() {
    $addMethod($grpc.ServiceMethod<$1.PostRequest, $1.PostReply>(
        'OnQuery',
        onQuery_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.PostRequest.fromBuffer(value),
        ($1.PostReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Empty, $1.Posts>(
        'OnFetchAll',
        onFetchAll_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Empty.fromBuffer(value),
        ($1.Posts value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$1.Token, $1.Posts>(
        'OnSearch',
        onSearch_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $1.Token.fromBuffer(value),
        ($1.Posts value) => value.writeToBuffer()));
  }

  $async.Future<$1.PostReply> onQuery_Pre(
      $grpc.ServiceCall call, $async.Future<$1.PostRequest> request) async {
    return onQuery(call, await request);
  }

  $async.Future<$1.Posts> onFetchAll_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Empty> request) async {
    return onFetchAll(call, await request);
  }

  $async.Future<$1.Posts> onSearch_Pre(
      $grpc.ServiceCall call, $async.Future<$1.Token> request) async {
    return onSearch(call, await request);
  }

  $async.Future<$1.PostReply> onQuery(
      $grpc.ServiceCall call, $1.PostRequest request);
  $async.Future<$1.Posts> onFetchAll($grpc.ServiceCall call, $1.Empty request);
  $async.Future<$1.Posts> onSearch($grpc.ServiceCall call, $1.Token request);
}
