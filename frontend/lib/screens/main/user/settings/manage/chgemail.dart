import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/styles.dart';

class ChgemailPage extends StatefulWidget {
  const ChgemailPage({Key? key}) : super(key: key);

  @override
  State<ChgemailPage> createState() => _ChgemailPageState();
}

class _ChgemailPageState extends State<ChgemailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '更换邮箱',
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
    );
  }
}
