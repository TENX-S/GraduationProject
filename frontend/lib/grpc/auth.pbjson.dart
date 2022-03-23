///
//  Generated code. Do not modify.
//  source: auth.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields,deprecated_member_use_from_same_package

import 'dart:core' as $core;
import 'dart:convert' as $convert;
import 'dart:typed_data' as $typed_data;
@$core.Deprecated('Use authErrorDescriptor instead')
const AuthError$json = const {
  '1': 'AuthError',
  '2': const [
    const {'1': 'MISMATCHED_PASSWORD', '2': 0},
    const {'1': 'NONEXISTENT_USER', '2': 1},
    const {'1': 'DUPLICATED_NAME', '2': 2},
    const {'1': 'UNKNOWN', '2': 3},
  ],
};

/// Descriptor for `AuthError`. Decode as a `google.protobuf.EnumDescriptorProto`.
final $typed_data.Uint8List authErrorDescriptor = $convert.base64Decode('CglBdXRoRXJyb3ISFwoTTUlTTUFUQ0hFRF9QQVNTV09SRBAAEhQKEE5PTkVYSVNURU5UX1VTRVIQARITCg9EVVBMSUNBVEVEX05BTUUQAhILCgdVTktOT1dOEAM=');
@$core.Deprecated('Use authRequestDescriptor instead')
const AuthRequest$json = const {
  '1': 'AuthRequest',
  '2': const [
    const {'1': 'name', '3': 1, '4': 1, '5': 9, '10': 'name'},
    const {'1': 'password', '3': 2, '4': 1, '5': 9, '10': 'password'},
  ],
};

/// Descriptor for `AuthRequest`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authRequestDescriptor = $convert.base64Decode('CgtBdXRoUmVxdWVzdBISCgRuYW1lGAEgASgJUgRuYW1lEhoKCHBhc3N3b3JkGAIgASgJUghwYXNzd29yZA==');
@$core.Deprecated('Use authReplyDescriptor instead')
const AuthReply$json = const {
  '1': 'AuthReply',
  '2': const [
    const {'1': 'success', '3': 1, '4': 1, '5': 8, '10': 'success'},
    const {'1': 'error', '3': 2, '4': 1, '5': 14, '6': '.z.museum.auth.AuthError', '9': 0, '10': 'error', '17': true},
  ],
  '8': const [
    const {'1': '_error'},
  ],
};

/// Descriptor for `AuthReply`. Decode as a `google.protobuf.DescriptorProto`.
final $typed_data.Uint8List authReplyDescriptor = $convert.base64Decode('CglBdXRoUmVwbHkSGAoHc3VjY2VzcxgBIAEoCFIHc3VjY2VzcxIzCgVlcnJvchgCIAEoDjIYLnoubXVzZXVtLmF1dGguQXV0aEVycm9ySABSBWVycm9yiAEBQggKBl9lcnJvcg==');
