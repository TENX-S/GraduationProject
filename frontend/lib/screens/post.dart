import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../common/router.dart';

class PostPage extends StatefulWidget {
  const PostPage({Key? key, this.query, this.from}) : super(key: key);
  final String? from;
  final String? query;

  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
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
        title: const Text('展品详情'),
      ),
      body: Column(
        children: [
          Text(widget.query!),
        ],
      ),
    );
  }
}
