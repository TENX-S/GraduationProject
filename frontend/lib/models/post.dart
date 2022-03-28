import 'package:frontend/services/proto/post.pb.dart';

class Post {
  final String id;
  final String name;
  final String dynasty;
  final String descr;
  final String intro;
  final String pic;

  const Post({
    required this.id,
    required this.name,
    required this.dynasty,
    required this.descr,
    required this.intro,
    required this.pic,
  });

  Post.fromReply({required PostReply reply})
      : id = reply.content.id,
        name = reply.content.name,
        dynasty = reply.content.dynasty,
        descr = reply.content.descr,
        intro = reply.content.intro,
        pic = reply.content.pic;
}

Map<String, Post> posts = {};
late Post currScanned;
