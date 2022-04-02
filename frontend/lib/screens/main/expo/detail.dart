import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:go_router/go_router.dart';

import '../../../common/styles.dart';

class DetailPage extends StatefulWidget {
  final String index;
  const DetailPage({Key? key, required this.index}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  late final String index;

  Future<String>? _loadIntro() async =>
      await rootBundle.loadString('assets/expo/$index.txt');

  @override
  void initState() {
    super.initState();
    index = widget.index;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '展览详情',
          style: TextStyle(
            color: AppColor.title,
            fontFamily: AppFont.title,
            fontSize: 23,
          ),
        ),
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: AppColor.title,
          ),
          onPressed: () => context.pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(5.0),
                child: Image.asset(
                  'assets/images/bar/$index.jpg',
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Divider(
              thickness: 10,
              color: AppColor.userBg,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: FutureBuilder(
                future: _loadIntro(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    var intro = snapshot.data as String;
                    var arr = intro.split('\n');
                    return Column(
                      children: List.generate(
                        arr.length,
                        (index) => Text('    ${arr[index]}'),
                      ),
                    );
                  } else {
                    return Center(
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: const SpinKitCubeGrid(
                          color: AppColor.primary,
                        ),
                      ),
                    );
                  }
                },
              ),
            ),
            const Divider(
              thickness: 10,
              color: AppColor.userBg,
            ),
          ],
        ),
      ),
    );
  }
}
