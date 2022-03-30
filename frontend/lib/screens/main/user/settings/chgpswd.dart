import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/styles.dart';

class ChgPswdPage extends StatefulWidget {
  const ChgPswdPage({Key? key}) : super(key: key);

  @override
  State<ChgPswdPage> createState() => _ChgPswdPageState();
}

class _ChgPswdPageState extends State<ChgPswdPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '修改密码',
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
      body: Column(),
    );
  }
}
