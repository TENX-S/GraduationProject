import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../../common/router.dart';
import '../../../../common/styles.dart';
import '../../../../models/user.dart';
import '../../user.dart';

class DataPage extends StatelessWidget {
  const DataPage({Key? key}) : super(key: key);

  Widget label(String name) => Padding(
        padding: const EdgeInsets.only(right: 5),
        child: Text(
          name,
          style: const TextStyle(
            fontFamily: AppFont.title,
            fontSize: 16,
          ),
        ),
      );

  TextStyle get labelTextStyle => const TextStyle(
        color: Color(0xFF868686),
        fontSize: 15,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '个人资料',
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
      body: ChangeNotifierProvider<User>.value(
        value: currUser,
        child: Column(
          children: [
            Consumer<User>(
              builder: (context, user, child) {
                return MenuBar(
                  title: '昵称',
                  textStyle: labelTextStyle,
                  trailing: label(user.name),
                  onPressed: () => context.push(AppRouter.name),
                );
              },
            ),
            Consumer<User>(
              builder: (context, user, child) {
                return MenuBar(
                  title: '性别',
                  textStyle: labelTextStyle,
                  trailing: label(user.gender),
                  onPressed: () => showCupertinoModalPopup(
                    context: context,
                    semanticsDismissible: true,
                    builder: (context) => CupertinoActionSheet(
                      cancelButton: CupertinoActionSheetAction(
                        child: const Text(
                          '取消',
                          style: TextStyle(color: Colors.red),
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                      actions: [
                        CupertinoActionSheetAction(
                          child: const Text('男'),
                          onPressed: () {
                            user.gender = '男';
                            Navigator.pop(context);
                          },
                        ),
                        CupertinoActionSheetAction(
                          child: const Text('女'),
                          onPressed: () {
                            user.gender = '女';
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Consumer<User>(
              builder: (context, user, child) {
                return MenuBar(
                  title: '生日',
                  onPressed: () => showCupertinoModalPopup(
                    context: context,
                    builder: (context) => SizedBox(
                      height: MediaQuery.of(context).size.height / 3,
                      child: CupertinoDatePicker(
                        mode: CupertinoDatePickerMode.date,
                        onDateTimeChanged: (date) => user.birthday =
                            DateFormat("yyyy-MM-dd").format(date),
                      ),
                    ),
                  ),
                  textStyle: labelTextStyle,
                  trailing: label(user.birthday),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

// class DataPage extends StatefulWidget {
//   const DataPage({Key? key}) : super(key: key);
//
//   @override
//   State<DataPage> createState() => _DataPageState();
// }
//
// class _DataPageState extends State<DataPage> {
// }
