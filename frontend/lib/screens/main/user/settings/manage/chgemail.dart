import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';

import '../../../../../common/styles.dart';
import '../../../../../common/tip.dart';
import '../../../../../models/user.dart';

class ChgemailPage extends StatefulWidget {
  const ChgemailPage({Key? key}) : super(key: key);

  @override
  State<ChgemailPage> createState() => _ChgemailPageState();
}

class _ChgemailPageState extends State<ChgemailPage> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();
    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

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
        actions: [
          ChangeNotifierProvider<User>.value(
            value: currUser,
            child: Consumer<User>(
              builder: (context, user, child) {
                return TextButton(
                  onPressed: () {
                    final email = _controller.text;
                    if (EmailValidator.validate(email)) {
                      user.email = email;
                    }
                    context.pop();
                    showTip(msg: '修改成功');
                  },
                  child: const Text(
                    '保存',
                    style: TextStyle(
                      color: AppColor.primary,
                      decoration: TextDecoration.underline,
                      fontFamily: AppFont.title,
                      fontSize: 15,
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(5, 15, 5, 0),
        child: TextField(
          controller: _controller,
          decoration: InputDecoration(
            isDense: false,
            hintText: '输入邮箱',
            contentPadding: const EdgeInsets.only(left: 10),
            fillColor: Colors.grey,
            border: const OutlineInputBorder(),
            suffixIcon: IconButton(
              onPressed: () => _controller.clear(),
              icon: const Icon(Icons.clear),
            ),
          ),
        ),
      ),
    );
  }
}
