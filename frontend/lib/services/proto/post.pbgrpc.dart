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

  PostClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$1.PostReply> onQuery($1.PostRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onQuery, request, options: options);
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
  }

  $async.Future<$1.PostReply> onQuery_Pre(
      $grpc.ServiceCall call, $async.Future<$1.PostRequest> request) async {
    return onQuery(call, await request);
  }

  $async.Future<$1.PostReply> onQuery(
      $grpc.ServiceCall call, $1.PostRequest request);
}
