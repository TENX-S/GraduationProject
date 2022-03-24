///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use postErrorDescriptor instead')
const PostError$json = const {
  '1': 'PostError',
  '2': const [
    const {'1': 'NONEXISTENT_POST', '2': 0},
    const {'1': 'INVALID_POST_ID', '2': 1},
    const {'1': 'UNKNOWN', '2': 2},
  ],
};

/// Descriptor for `PostError`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List postErrorDescriptor = $convert.base64Decode('CglQb3N0RXJyb3ISFAoQTk9ORVhJU1RFTlRfUE9TVBAAEhMKD0lOVkFMSURfUE9TVF9JRBABEgsKB1VOS05PV04QAg==');
@$core.Deprecated('Use postRequestDescriptor instead')
const PostRequest$json = const {
  '1': 'PostRequest',
  '2': const [
    const {'1': 'id', '3': 1, '4': 1, '5': 9, '10': 'id'},
  ],
};

/// Descriptor for `PostRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postRequestDescriptor = $convert.base64Decode('CgtQb3N0UmVxdWVzdBIOCgJpZBgBIAEoCVICaWQ=');
@$core.Deprecated('Use postReplyDescriptor instead')
const PostReply$json = const {
  '1': 'PostReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'content', '3': 2, '4': 1, '5': 11, '6': '.z.museum.post.PostContent', '9': 0, '10': 'content', '17': true},
    const {'1': 'error', '3': 3, '4': 1, '5': 14, '6': '.z.museum.post.PostError', '9': 1, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_content'},
    const {'1': '_error'},
  ],
};

/// Descriptor for `PostReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postReplyDescriptor = $convert.base64Decode('CglQb3N0UmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxI5Cgdjb250ZW50GAIgASgLMhouei5tdXNldW0ucG9zdC5Qb3N0Q29udGVudEgAUgdjb250ZW50iAEBEjMKBWVycm9yGAMgASgOMhguei5tdXNldW0ucG9zdC5Qb3N0RXJyb3JIAVIFZXJyb3KIAQFCCgoIX2NvbnRlbnRCCAoGX2Vycm9y');
@$core.Deprecated('Use postContentDescriptor instead')
const PostContent$json = const {
  '1': 'PostContent',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'dynasty', '3': 2, '4': 1, '5': 9, '10': 'dynasty'},
    const {'1': 'descr', '3': 3, '4': 1, '5': 9, '10': 'descr'},
    const {'1': 'intro', '3': 4, '4': 1, '5': 9, '10': 'intro'},
    const {'1': 'pic', '3': 5, '4': 1, '5': 9, '10': 'pic'},
  ],
};

/// Descriptor for `PostContent`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List postContentDescriptor = $convert.base64Decode('CgtQb3N0Q29udGVudBISCgRuYW1lGAEgASgJUgRuYW1lEhgKB2R5bmFzdHkYAiABKAlSB2R5bmFzdHkSFAoFZGVzY3IYAyABKAlSBWRlc2NyEhQKBWludHJvGAQgASgJUgVpbnRybxIQCgNwaWMYBSABKAlSA3BpYw==');
