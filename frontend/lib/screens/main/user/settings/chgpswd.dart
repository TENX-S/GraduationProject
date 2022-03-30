import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/common/tip.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../../common/styles.dart';
import '../../../../models/user.dart';

class ChgPswdPage extends StatefulWidget {
  const ChgPswdPage({Key? key}) : super(key: key);

  @override
  State<ChgPswdPage> createState() => _ChgPswdPageState();
}

class _ChgPswdPageState extends State<ChgPswdPage> {
  late TextEditingController old;
  late TextEditingController latest;
  late TextEditingController again;

  @override
  void initState() {
    super.initState();
    old = TextEditingController();
    latest = TextEditingController();
    again = TextEditingController();
  }

  @override
  void dispose() {
    old.dispose();
    latest.dispose();
    again.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: ChangeNotifierProvider.value(
          value: currUser,
          child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Consumer<User>(
                          builder: (context, user, child) {
                            return Text(
                              user.email,
                              style: GoogleFonts.libreBaskerville(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                              ),
                            );
                          },
                        ),
                        const Text(
                          '当前绑定邮箱',
                          style: TextStyle(
                            color: AppColor.userDataText,
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: old,
                      decoration: const InputDecoration(
                        isDense: false,
                        hintText: '输入旧密码',
                        hintStyle: TextStyle(fontSize: 13),
                        fillColor: Colors.grey,
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: latest,
                      decoration: const InputDecoration(
                        isDense: false,
                        hintText: '输入新密码',
                        hintStyle: TextStyle(fontSize: 13),
                        fillColor: Colors.grey,
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      controller: again,
                      decoration: const InputDecoration(
                        isDense: false,
                        hintText: '再次输入密码',
                        hintStyle: TextStyle(fontSize: 13),
                        fillColor: Colors.grey,
                        border: UnderlineInputBorder(),
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Consumer<User>(
                  builder: (context, user, child) {
                    return MaterialButton(
                      onPressed: () {
                        if (old.text != user.password) {
                          showTip(msg: '原密码错误', gravity: ToastGravity.CENTER);
                          return;
                        }
                        if (latest.text.length < 6) {
                          showTip(msg: '密码格式不正确', gravity: ToastGravity.CENTER);
                          return;
                        }
                        if (again.text != latest.text) {
                          showTip(msg: '两次密码不一致', gravity: ToastGravity.CENTER);
                          return;
                        }
                        user.password = latest.text;
                      },
                      color: AppColor.primary,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.75,
                        height: 45,
                        child: const Center(
                          child: Text(
                            '确认修改',
                            style: TextStyle(
                              color: Colors.white,
                              decoration: TextDecoration.underline,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
