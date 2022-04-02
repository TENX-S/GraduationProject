import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:frontend/screens/main/search.dart';
import 'package:go_router/go_router.dart';

import '../../../../services/client.dart';
import '../../common/router.dart';
import '../../common/styles.dart';
import '../../models/post.dart';

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
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '馆藏精品',
          style: TextStyle(
            fontFamily: AppFont.title,
            color: AppColor.title,
            fontWeight: FontWeight.normal,
            fontSize: 23,
          ),
        ),
        actions: [
          IconButton(
            color: AppColor.title,
            onPressed: () async =>
                await showSearch(context: context, delegate: search),
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5.0),
              child: Container(
                margin: const EdgeInsets.only(bottom: 6.0),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8.0)),
                    child: Image.asset('assets/images/ad3.jpg'),
                  ),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.grey,
                      offset: Offset(0.0, 1.0),
                      blurRadius: 6.0,
                    ),
                  ],
                ),
              ),
            ),
            FutureBuilder(
              future: _fetchAllPosts(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    return _buildGridView(
                      context: context,
                      posts: snapshot.data as List<Post>,
                    );
                  }
                }
                return const Center(
                  child: SpinKitCubeGrid(
                    color: AppColor.primary,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<List<Post>>? _fetchAllPosts() async {
    if (posts.isEmpty) {
      return Client().onFetchAll().then((p) {
        for (var reply in p.posts) {
          posts[reply.content.id] = Post.fromReply(reply: reply);
        }
        return posts.values.toList();
      });
    } else {
      return posts.values.toList();
    }
  }

  Widget _buildGridView({
    required BuildContext context,
    required List<Post> posts,
  }) {
    return Container(
      padding: const EdgeInsets.only(top: 4),
      color: const Color.fromARGB(255, 236, 236, 234),
      child: MasonryGridView.count(
        primary: false,
        shrinkWrap: true,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        crossAxisCount: 2,
        itemCount: posts.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => context.push(
                '${AppRouter.post}?query=${posts[index].id}&from=${AppRouter.coll}?'),
            child: Card(
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    5,
                  ),
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: CachedNetworkImage(
                      imageUrl: posts[index].pic,
                      fit: BoxFit.fill,
                      placeholder: (context, url) => const SizedBox(
                        height: 200,
                        child: Center(
                          child: SpinKitCubeGrid(
                            color: AppColor.primary,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 5),
                    child: Text(
                      posts[index].name,
                      textAlign: TextAlign.start,
                      style: const TextStyle(
                        fontFamily: AppFont.label,
                        color: AppColor.title,
                      ),
                      maxLines: 2,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
