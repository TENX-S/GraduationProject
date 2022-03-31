import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:frontend/screens/screen.dart';
import 'package:go_router/go_router.dart';

import '../../common/router.dart';
import '../../common/styles.dart';

class ExpoPage extends StatefulWidget {
  const ExpoPage({Key? key}) : super(key: key);

  @override
  State<ExpoPage> createState() => _ExpoPageState();
}

class _ExpoPageState extends State<ExpoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '展览',
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
            onPressed: () => {},
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
                    child: Image.asset('assets/images/ad4.jpg'),
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
            Container(
              padding: const EdgeInsets.fromLTRB(15, 10, 15, 0),
              color: const Color.fromARGB(255, 236, 236, 234),
              child: GridView.count(
                primary: false,
                crossAxisCount: 2,
                shrinkWrap: true,
                childAspectRatio: 3.3 / 5,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: List.generate(exhibitionArr.length, (index) {
                  return GestureDetector(
                    onTap: () =>
                        context.push('${AppRouter.detail}/?index=${index + 1}'),
                    child: ClipRRect(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      child: Container(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Image.asset(
                              'assets/images/slider/${index + 1}.jpg',
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: AutoSizeText(
                                exhibitionArr[index],
                                maxLines: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
