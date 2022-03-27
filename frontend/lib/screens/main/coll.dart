import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frontend/services/proto/post.pb.dart';

import '../../../../services/client.dart';
import '../../common/styles.dart';

// void here(BuildContext context, String query) {
//   context.push('${AppRouter.post}?query=$query&from=${AppRouter.coll}?');
// }

class CollPage extends StatefulWidget {
  const CollPage({Key? key}) : super(key: key);

  @override
  State<CollPage> createState() => _CollPageState();
}

class _CollPageState extends State<CollPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '馆藏精品',
          style: TextStyle(
            fontFamily: AppFont.title,
            color: AppColor.collAppBarTitle,
            fontWeight: FontWeight.normal,
            fontSize: 28,
          ),
        ),
        actions: [
          IconButton(
            color: AppColor.collAppBarTitle,
            onPressed: () => {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(13.0),
              child: ClipRRect(
                borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                child: Image.asset('assets/images/ad3.jpg'),
              ),
            ),
            FutureBuilder(
              future: _fetchAllPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return _buildGridView(
                      context: context,
                      posts: snapshot.data as List<PostReply>,
                    );
                  } else {
                    return const Center(
                      child: SpinKitCubeGrid(
                        color: AppColor.primary,
                      ),
                    );
                  }
                } else {
                  return const Center(
                    child: SpinKitCubeGrid(
                      color: AppColor.primary,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<PostReply>>? _fetchAllPosts() async =>
      Client().onFetchAll().then((p) => p.posts);

  Widget _buildGridView({
    required BuildContext context,
    required List<PostReply> posts,
  }) {
    return MasonryGridView.count(
      primary: false,
      shrinkWrap: true,
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      crossAxisCount: 2,
      itemCount: posts.length,
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              CachedNetworkImage(
                imageUrl: posts[index].content.pic,
                fit: BoxFit.fill,
                placeholder: (context, url) => const Center(
                  child: SpinKitCubeGrid(
                    color: AppColor.primary,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 5),
                child: Text(
                  posts[index].content.name,
                  textAlign: TextAlign.start,
                  style: const TextStyle(
                    fontFamily: AppFont.label,
                    color: AppColor.collAppBarTitle,
                  ),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        );
      },
      // children: List<Widget>.generate(
      //   posts.length,
      //   (index) => Card(
      //     child: Column(
      //       mainAxisAlignment: MainAxisAlignment.spaceAround,
      //       children: [
      //         Flexible(
      //           child: CachedNetworkImage(
      //             imageUrl: posts[index].content.pic,
      //             fit: BoxFit.fill,
      //             placeholder: (context, url) => const Center(
      //               child: SpinKitCubeGrid(
      //                 color: AppColor.primary,
      //               ),
      //             ),
      //           ),
      //         ),
      //         Flexible(
      //           child: Text(
      //             posts[index].content.name,
      //             textAlign: TextAlign.start,
      //             style: const TextStyle(
      //               fontFamily: AppFont.label,
      //               color: AppColor.collAppBarTitle,
      //             ),
      //             maxLines: 2,
      //           ),
      //         ),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
