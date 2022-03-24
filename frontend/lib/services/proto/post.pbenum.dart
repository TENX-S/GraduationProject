///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

// ignore_for_file: UNDEFINED_SHOWN_NAME
import 'dart:core' as $core;
import 'package:protobuf/protobuf.dart' as $pb;

class PostError extends $pb.ProtobufEnum {
  static const PostError NONEXISTENT_POST = PostError._(0, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'NONEXISTENT_POST');
  static const PostError INVALID_POST_ID = PostError._(1, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'INVALID_POST_ID');
  static const PostError UNKNOWN = PostError._(2, const $core.bool.fromEnvironment('protobuf.omit_enum_names') ? '' : 'UNKNOWN');

  static const $core.List<PostError> values = <PostError> [
    NONEXISTENT_POST,
    INVALID_POST_ID,
    UNKNOWN,
  ];

  static final $core.Map<$core.int, PostError> _byValue = $pb.ProtobufEnum.initByValue(values);
  static PostError? valueOf($core.int value) => _byValue[value];

  const PostError._($core.int v, $core.String n) : super(v, n);
}

