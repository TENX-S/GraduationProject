///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:async' as $async;

import 'dart:core' as $core;

import 'package:grpc/service_api.dart' as $grpc;
import 'auth.pb.dart' as $0;
export 'auth.pb.dart';

class AuthenticateClient extends $grpc.Client {
  static final _$onLogin = $grpc.ClientMethod<$0.AuthRequest, $0.AuthReply>(
      '/z.museum.auth.Authenticate/OnLogin',
      ($0.AuthRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthReply.fromBuffer(value));
  static final _$onSignUp = $grpc.ClientMethod<$0.AuthRequest, $0.AuthReply>(
      '/z.museum.auth.Authenticate/OnSignUp',
      ($0.AuthRequest value) => value.writeToBuffer(),
      ($core.List<$core.int> value) => $0.AuthReply.fromBuffer(value));

  AuthenticateClient($grpc.ClientChannel channel,
      {$grpc.CallOptions? options,
      $core.Iterable<$grpc.ClientInterceptor>? interceptors})
      : super(channel, options: options, interceptors: interceptors);

  $grpc.ResponseFuture<$0.AuthReply> onLogin($0.AuthRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onLogin, request, options: options);
  }

  $grpc.ResponseFuture<$0.AuthReply> onSignUp($0.AuthRequest request,
      {$grpc.CallOptions? options}) {
    return $createUnaryCall(_$onSignUp, request, options: options);
  }
}

abstract class AuthenticateServiceBase extends $grpc.Service {
  $core.String get $name => 'z.museum.auth.Authenticate';

  AuthenticateServiceBase() {
    $addMethod($grpc.ServiceMethod<$0.AuthRequest, $0.AuthReply>(
        'OnLogin',
        onLogin_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthRequest.fromBuffer(value),
        ($0.AuthReply value) => value.writeToBuffer()));
    $addMethod($grpc.ServiceMethod<$0.AuthRequest, $0.AuthReply>(
        'OnSignUp',
        onSignUp_Pre,
        false,
        false,
        ($core.List<$core.int> value) => $0.AuthRequest.fromBuffer(value),
        ($0.AuthReply value) => value.writeToBuffer()));
  }

  $async.Future<$0.AuthReply> onLogin_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AuthRequest> request) async {
    return onLogin(call, await request);
  }

  $async.Future<$0.AuthReply> onSignUp_Pre(
      $grpc.ServiceCall call, $async.Future<$0.AuthRequest> request) async {
    return onSignUp(call, await request);
  }

  $async.Future<$0.AuthReply> onLogin(
      $grpc.ServiceCall call, $0.AuthRequest request);
  $async.Future<$0.AuthReply> onSignUp(
      $grpc.ServiceCall call, $0.AuthRequest request);
}
