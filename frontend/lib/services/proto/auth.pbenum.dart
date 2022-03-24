///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class AuthError extends $pb.ProtobufEnum {
  static const AuthError MISMATCHED_PASSWORD = AuthError._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'MISMATCHED_PASSWORD');
  static const AuthError NONEXISTENT_USER = AuthError._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONEXISTENT_USER');
  static const AuthError DUPLICATED_NAME = AuthError._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'DUPLICATED_NAME');
  static const AuthError UNKNOWN = AuthError._(3, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');

  static const $core.List<AuthError> values = <AuthError> [
    MISMATCHED_PASSWORD,
    NONEXISTENT_USER,
    DUPLICATED_NAME,
    UNKNOWN,
  ];

  static final $core.Map<$core.int, AuthError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static AuthError? valueOf($core.int value) => _byValue[value];

  const AuthError._($core.int v, $core.String n) : super(v, n);
}

