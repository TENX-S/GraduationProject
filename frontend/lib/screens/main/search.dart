import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:frontend/models/post.dart';
import 'package:go_router/go_router.dart';

import '../../common/router.dart';
import '../../common/styles.dart';
import '../../services/client.dart';

var search = Search();

class Search extends SearchDelegate<Future<Widget>> {
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = '';
        },
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        close(context, Future.value(Container()));
      },
    );
  }

  Future<List<Post>> _search(String token) async =>
      await Client().onSearch(token).then(
          (value) => value.posts.map((e) => Post.fromReply(reply: e)).toList());

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
      future: _search(query),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasData) {
            final posts = snapshot.data as List<Post>;
            if (posts.isEmpty) {
              return Container();
            } else {
              return ListView.builder(
                itemCount: posts.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
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
                    ),
                  );
                },
              );
            }
          }
        }
        return const Center(child: SpinKitCubeGrid(color: AppColor.primary));
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
