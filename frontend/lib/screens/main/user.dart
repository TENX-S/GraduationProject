import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:provider/provider.dart';

import '../../common/router.dart';
import '../../common/styles.dart';
import '../../models/user.dart';

class UserPage extends StatefulWidget {
  const UserPage({Key? key}) : super(key: key);

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: false,
        backgroundColor: Colors.white,
        title: const Text(
          '我的',
          style: TextStyle(
            fontFamily: AppFont.title,
            fontSize: 23,
            color: AppColor.title,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () => context.push(AppRouter.settings),
            icon: const Icon(
              Icons.settings_outlined,
              color: AppColor.title,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              color: AppColor.userBg,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: GestureDetector(
                  onTap: () => context.push(AppRouter.data),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/images/user.png'),
                          backgroundColor: AppColor.userAvatarBg,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 5, 0, 2),
                        child: Consumer<User>(
                          builder: (context, user, child) {
                            return Text(
                              user.name,
                              style: const TextStyle(
                                color: AppColor.title,
                                fontFamily: AppFont.title,
                                fontSize: 20,
                                decoration: TextDecoration.underline,
                              ),
                            );
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 2),
                        child: Consumer<User>(
                          builder: (context, user, child) {
                            return Text(
                              user.email,
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 14,
                              ),
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.fromLTRB(0, 2, 0, 10),
                        child: Text(
                          '欢迎来到博物馆~',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 13,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Column(
              children: [
                MenuBar(
                  onPressed: () {},
                  icon: const Icon(MdiIcons.calendarCheckOutline),
                  title: '我的预约',
                ),
                MenuBar(
                  onPressed: () {},
                  icon: const Icon(MdiIcons.starOutline),
                  title: '我的收藏',
                ),
                MenuBar(
                  onPressed: () {},
                  icon: const Icon(MdiIcons.clipboardListOutline),
                  title: '我的行程',
                ),
                const Divider(
                  thickness: 20,
                  color: AppColor.userBg,
                ),
                MenuBar(
                  onPressed: () {},
                  icon: const Icon(MdiIcons.messageProcessingOutline),
                  title: '消息通知',
                ),
                MenuBar(
                  onPressed: () {},
                  icon: const Icon(LineAwesomeIcons.envelope_1),
                  title: '意见反馈',
                ),
                MenuBar(
                  onPressed: () {},
                  icon: const Icon(MdiIcons.messageTextOutline),
                  title: '我的评论',
                ),
                const Divider(
                  thickness: 20,
                  color: AppColor.userBg,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MenuBar extends StatelessWidget {
  final Widget? icon;
  final Widget? trailing;
  final String title;
  final TextStyle? textStyle;
  final void Function()? onPressed;
  const MenuBar({
    Key? key,
    required this.title,
    required this.onPressed,
    this.icon,
    this.trailing,
    this.textStyle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon ?? Container(),
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                title,
                style: textStyle ?? const TextStyle(fontSize: 15),
              ),
            ),
            Expanded(child: Container()),
            trailing ?? Container(),
            const Icon(
              Icons.arrow_forward_ios,
              size: 15,
            ),
          ],
        ),
      ),
    );
  }
}
