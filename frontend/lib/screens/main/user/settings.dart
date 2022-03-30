import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/common/tip.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../../common/router.dart';
import '../../../common/styles.dart';
import '../user.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '我的',
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
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
              MenuBar(
                onPressed: () => context.push(AppRouter.data),
                icon: const Icon(LineAwesomeIcons.identification_card_1),
                title: '个人资料',
              ),
              MenuBar(
                onPressed: () => context.push(AppRouter.chgpswd),
                icon: const Icon(LineAwesomeIcons.lock_open),
                title: '修改密码',
              ),
              MenuBar(
                onPressed: () => context.push(AppRouter.manage),
                icon: const Icon(LineAwesomeIcons.alternate_shield),
                title: '账号管理',
              ),
              MenuBar(
                onPressed: () {},
                icon: const Icon(LineAwesomeIcons.certificate),
                title: '隐私设置',
              ),
              MenuBar(
                onPressed: () {},
                icon: const Icon(LineAwesomeIcons.brush),
                title: '清除缓存',
              ),
              MenuBar(
                onPressed: () => showTip(
                  msg: '当前已是最新版本',
                  gravity: ToastGravity.CENTER,
                ),
                icon: const Icon(LineAwesomeIcons.info_circle),
                title: '当前版本',
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 40),
            child: MaterialButton(
              onPressed: () {},
              color: AppColor.primary,
              child: SizedBox(
                width: MediaQuery.of(context).size.width * 0.75,
                height: 45,
                child: const Center(
                  child: Text(
                    '退出登录',
                    style: TextStyle(
                      color: Colors.white,
                      decoration: TextDecoration.underline,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
