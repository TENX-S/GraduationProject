///
//  Generated code. Do not modify.
//  source: post.proto
//
// @dart = 2.12
// ignore_for_file: annotate_overrides,camel_case_types,unnecessary_const,non_constant_identifier_names,library_prefixes,unused_import,unused_shown_name,return_of_invalid_type,unnecessary_this,prefer_final_fields

import 'dart:core' as $core;

import 'package:protobuf/protobuf.dart' as $pb;

import 'post.pbenum.dart';

export 'post.pbenum.dart';

class PostRequest extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostRequest', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'z.museum.post'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..hasRequiredFields = false
  ;

  PostRequest._() : super();
  factory PostRequest({
    $core.String? id,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    return _result;
  }
  factory PostRequest.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostRequest.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostRequest clone() => PostRequest()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostRequest copyWith(void Function(PostRequest) updates) => super.copyWith((message) => updates(message as PostRequest)) as PostRequest; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostRequest create() => PostRequest._();
  PostRequest createEmptyInstance() => create();
  static $pb.PbList<PostRequest> createRepeated() => $pb.PbList<PostRequest>();
  @$core.pragma('dart2js:noInline')
  static PostRequest getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostRequest>(create);
  static PostRequest? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);
}

class Empty extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Empty', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'z.museum.post'), createEmptyInstance: create)
    ..hasRequiredFields = false
  ;

  Empty._() : super();
  factory Empty() => create();
  factory Empty.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Empty.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Empty clone() => Empty()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Empty copyWith(void Function(Empty) updates) => super.copyWith((message) => updates(message as Empty)) as Empty; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Empty create() => Empty._();
  Empty createEmptyInstance() => create();
  static $pb.PbList<Empty> createRepeated() => $pb.PbList<Empty>();
  @$core.pragma('dart2js:noInline')
  static Empty getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Empty>(create);
  static Empty? _defaultInstance;
}

class Posts extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'Posts', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'z.museum.post'), createEmptyInstance: create)
    ..pc<PostReply>(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'posts', $pb.PbFieldType.PM, subBuilder: PostReply.create)
    ..hasRequiredFields = false
  ;

  Posts._() : super();
  factory Posts({
    $core.Iterable<PostReply>? posts,
  }) {
    final _result = create();
    if (posts != null) {
      _result.posts.addAll(posts);
    }
    return _result;
  }
  factory Posts.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory Posts.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  Posts clone() => Posts()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  Posts copyWith(void Function(Posts) updates) => super.copyWith((message) => updates(message as Posts)) as Posts; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static Posts create() => Posts._();
  Posts createEmptyInstance() => create();
  static $pb.PbList<Posts> createRepeated() => $pb.PbList<Posts>();
  @$core.pragma('dart2js:noInline')
  static Posts getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<Posts>(create);
  static Posts? _defaultInstance;

  @$pb.TagNumber(1)
  $core.List<PostReply> get posts => $_getList(0);
}

class PostReply extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostReply', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'z.museum.post'), createEmptyInstance: create)
    ..aOB(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'success')
    ..aOM<PostContent>(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'content', subBuilder: PostContent.create)
    ..e<PostError>(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'error', $pb.PbFieldType.OE, defaultOrMaker: PostError.NONEXISTENT_POST, valueOf: PostError.valueOf, enumValues: PostError.values)
    ..hasRequiredFields = false
  ;

  PostReply._() : super();
  factory PostReply({
    $core.bool? success,
    PostContent? content,
    PostError? error,
  }) {
    final _result = create();
    if (success != null) {
      _result.success = success;
    }
    if (content != null) {
      _result.content = content;
    }
    if (error != null) {
      _result.error = error;
    }
    return _result;
  }
  factory PostReply.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostReply.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostReply clone() => PostReply()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostReply copyWith(void Function(PostReply) updates) => super.copyWith((message) => updates(message as PostReply)) as PostReply; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostReply create() => PostReply._();
  PostReply createEmptyInstance() => create();
  static $pb.PbList<PostReply> createRepeated() => $pb.PbList<PostReply>();
  @$core.pragma('dart2js:noInline')
  static PostReply getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostReply>(create);
  static PostReply? _defaultInstance;

  @$pb.TagNumber(1)
  $core.bool get success => $_getBF(0);
  @$pb.TagNumber(1)
  set success($core.bool v) { $_setBool(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasSuccess() => $_has(0);
  @$pb.TagNumber(1)
  void clearSuccess() => clearField(1);

  @$pb.TagNumber(2)
  PostContent get content => $_getN(1);
  @$pb.TagNumber(2)
  set content(PostContent v) { setField(2, v); }
  @$pb.TagNumber(2)
  $core.bool hasContent() => $_has(1);
  @$pb.TagNumber(2)
  void clearContent() => clearField(2);
  @$pb.TagNumber(2)
  PostContent ensureContent() => $_ensure(1);

  @$pb.TagNumber(3)
  PostError get error => $_getN(2);
  @$pb.TagNumber(3)
  set error(PostError v) { setField(3, v); }
  @$pb.TagNumber(3)
  $core.bool hasError() => $_has(2);
  @$pb.TagNumber(3)
  void clearError() => clearField(3);
}

class PostContent extends $pb.GeneratedMessage {
  static final $pb.BuilderInfo _i = $pb.BuilderInfo(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'PostContent', package: const $pb.PackageName(const $core.bool.fromEnvironment('protobuf.omit_message_names') ? '' : 'z.museum.post'), createEmptyInstance: create)
    ..aOS(1, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'id')
    ..aOS(2, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'name')
    ..aOS(3, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'dynasty')
    ..aOS(4, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'descr')
    ..aOS(5, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'intro')
    ..aOS(6, const $core.bool.fromEnvironment('protobuf.omit_field_names') ? '' : 'pic')
    ..hasRequiredFields = false
  ;

  PostContent._() : super();
  factory PostContent({
    $core.String? id,
    $core.String? name,
    $core.String? dynasty,
    $core.String? descr,
    $core.String? intro,
    $core.String? pic,
  }) {
    final _result = create();
    if (id != null) {
      _result.id = id;
    }
    if (name != null) {
      _result.name = name;
    }
    if (dynasty != null) {
      _result.dynasty = dynasty;
    }
    if (descr != null) {
      _result.descr = descr;
    }
    if (intro != null) {
      _result.intro = intro;
    }
    if (pic != null) {
      _result.pic = pic;
    }
    return _result;
  }
  factory PostContent.fromBuffer($core.List<$core.int> i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromBuffer(i, r);
  factory PostContent.fromJson($core.String i, [$pb.ExtensionRegistry r = $pb.ExtensionRegistry.EMPTY]) => create()..mergeFromJson(i, r);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.deepCopy] instead. '
  'Will be removed in next major version')
  PostContent clone() => PostContent()..mergeFromMessage(this);
  @$core.Deprecated(
  'Using this can add significant overhead to your binary. '
  'Use [GeneratedMessageGenericExtensions.rebuild] instead. '
  'Will be removed in next major version')
  PostContent copyWith(void Function(PostContent) updates) => super.copyWith((message) => updates(message as PostContent)) as PostContent; // ignore: deprecated_member_use
  $pb.BuilderInfo get info_ => _i;
  @$core.pragma('dart2js:noInline')
  static PostContent create() => PostContent._();
  PostContent createEmptyInstance() => create();
  static $pb.PbList<PostContent> createRepeated() => $pb.PbList<PostContent>();
  @$core.pragma('dart2js:noInline')
  static PostContent getDefault() => _defaultInstance ??= $pb.GeneratedMessage.$_defaultFor<PostContent>(create);
  static PostContent? _defaultInstance;

  @$pb.TagNumber(1)
  $core.String get id => $_getSZ(0);
  @$pb.TagNumber(1)
  set id($core.String v) { $_setString(0, v); }
  @$pb.TagNumber(1)
  $core.bool hasId() => $_has(0);
  @$pb.TagNumber(1)
  void clearId() => clearField(1);

  @$pb.TagNumber(2)
  $core.String get name => $_getSZ(1);
  @$pb.TagNumber(2)
  set name($core.String v) { $_setString(1, v); }
  @$pb.TagNumber(2)
  $core.bool hasName() => $_has(1);
  @$pb.TagNumber(2)
  void clearName() => clearField(2);

  @$pb.TagNumber(3)
  $core.String get dynasty => $_getSZ(2);
  @$pb.TagNumber(3)
  set dynasty($core.String v) { $_setString(2, v); }
  @$pb.TagNumber(3)
  $core.bool hasDynasty() => $_has(2);
  @$pb.TagNumber(3)
  void clearDynasty() => clearField(3);

  @$pb.TagNumber(4)
  $core.String get descr => $_getSZ(3);
  @$pb.TagNumber(4)
  set descr($core.String v) { $_setString(3, v); }
  @$pb.TagNumber(4)
  $core.bool hasDescr() => $_has(3);
  @$pb.TagNumber(4)
  void clearDescr() => clearField(4);

  @$pb.TagNumber(5)
  $core.String get intro => $_getSZ(4);
  @$pb.TagNumber(5)
  set intro($core.String v) { $_setString(4, v); }
  @$pb.TagNumber(5)
  $core.bool hasIntro() => $_has(4);
  @$pb.TagNumber(5)
  void clearIntro() => clearField(5);

  @$pb.TagNumber(6)
  $core.String get pic => $_getSZ(5);
  @$pb.TagNumber(6)
  set pic($core.String v) { $_setString(5, v); }
  @$pb.TagNumber(6)
  $core.bool hasPic() => $_has(5);
  @$pb.TagNumber(6)
  void clearPic() => clearField(6);
}

