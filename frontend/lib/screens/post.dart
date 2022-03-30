import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../common/router.dart';
import '../common/styles.dart';
import '../models/post.dart';
import '../services/client.dart';
import '../services/proto/post.pbenum.dart';

class PostPage extends StatefulWidget {
  final String? from;
  final String? query;
  const PostPage({Key? key, this.query, this.from}) : super(key: key);

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  Future<dynamic> queryPost({required String id}) async =>
      Client().onQuery(id).then((reply) {
        if (reply.success) {
          return Post.fromReply(reply: reply);
        }
        switch (reply.error) {
          case PostError.INVALID_POST_ID:
          case PostError.NONEXISTENT_POST:
            return "数据加载失败";
          case PostError.UNKNOWN:
            return "目前服务不可用";
        }
      });

  @override
  Widget build(BuildContext context) {
    if (widget.from == AppRouter.scan) {
      return _scannedPost(context, widget.query!);
    } else {
      return _buildPost(context, posts[widget.query!]!);
    }
  }

  Widget _scannedPost(BuildContext context, String id) {
    return FutureBuilder(
      future: queryPost(id: id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            if (snapshot.data is Post) {
              return _buildPost(context, snapshot.data! as Post);
            }
            if (snapshot.data is String) {
              return Error(err: snapshot.data! as String);
            }
          }
        }
        return const Center(
          child: SpinKitCubeGrid(
            color: AppColor.primary,
          ),
        );
      },
    );
  }

  Widget _buildPost(BuildContext context, Post post) {
    var descs =
        post.descr.split('-').where((d) => d.trim().isNotEmpty).toList();
    var intros =
        post.intro.split('-').where((d) => d.trim().isNotEmpty).toList();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.title,
          ),
          onPressed: () {
            switch (widget.from) {
              case AppRouter.scan:
                context.go(AppRouter.main);
                break;
              case AppRouter.coll:
                context.pop();
                break;
            }
          },
        ),
        title: const Text(
          '藏品详情',
          style: TextStyle(
            fontFamily: AppFont.title,
            color: AppColor.title,
            fontSize: 23,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: IconButton(
              icon: const Icon(
                Icons.ios_share,
                color: AppColor.title,
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            CachedNetworkImage(
              height: 400,
              imageUrl: post.pic,
              fit: BoxFit.fill,
              placeholder: (context, url) => const SizedBox(
                height: 300,
                child: Center(
                  child: SpinKitCubeGrid(
                    color: AppColor.primary,
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 10,
              color: AppColor.userBg,
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        flex: 5,
                        child: Text(
                          post.name,
                          style: const TextStyle(
                            color: AppColor.title,
                            fontFamily: AppFont.title,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 37,
                        width: 100,
                        child: MaterialButton(
                          elevation: 0,
                          onPressed: () {},
                          color: AppColor.primary,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              IconButton(
                                padding: EdgeInsets.zero,
                                constraints: const BoxConstraints(),
                                icon: const Icon(Icons.star_border_rounded),
                                color: AppColor.postCollectButton,
                                onPressed: () {},
                              ),
                              const Text(
                                '收藏',
                                style: TextStyle(
                                  fontFamily: AppFont.label,
                                  color: AppColor.postCollectButton,
                                  fontSize: 13,
                                  decoration: TextDecoration.underline,
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Flexible(
                          flex: 11,
                          child: Column(
                            children: List<Widget>.generate(
                              descs.length,
                              (idx) => Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 2),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Flexible(
                                      child: Text(
                                        descs[idx],
                                        maxLines: 3,
                                        overflow: TextOverflow.ellipsis,
                                        style: const TextStyle(
                                          color: AppColor.postDescr,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 4,
                          child: Center(
                            child: Text(
                              post.dynasty,
                              style: const TextStyle(
                                color: AppColor.title,
                                fontFamily: AppFont.dynasty,
                                fontSize: 20,
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Divider(
              thickness: 10,
              color: AppColor.userBg,
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: List<Widget>.generate(
                  intros.length,
                  (idx) => Text(
                    "  ${intros[idx]}",
                    style: const TextStyle(
                      wordSpacing: 8,
                      letterSpacing: 1.0,
                    ),
                  ),
                ),
              ),
            ),
            const Divider(
              thickness: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class Error extends StatelessWidget {
  final String err;
  const Error({Key? key, required this.err}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.title,
          ),
          onPressed: () => context.go(AppRouter.main),
        ),
        title: const Text(
          '数据加载失败',
          style: TextStyle(
            fontFamily: AppFont.title,
            color: Colors.black,
            fontSize: 23,
          ),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/error.jpg',
              fit: BoxFit.fill,
            ),
            Text(
              err,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 15,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
