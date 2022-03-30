import 'package:flutter/material.dart';
import 'package:frontend/screens/main/user.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/router.dart';
import '../../../../common/styles.dart';

class ManagePage extends StatefulWidget {
  const ManagePage({Key? key}) : super(key: key);

  @override
  State<ManagePage> createState() => _ManagePageState();
}

class _ManagePageState extends State<ManagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '账号管理',
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
      body: Column(
        children: [
          MenuBar(
            title: '更换邮箱',
            onPressed: () => context.push(AppRouter.chgemail),
          ),
          MenuBar(
            title: '账号注销',
            onPressed: () => context.push(AppRouter.unsubscribe),
          ),
        ],
      ),
    );
  }
}
