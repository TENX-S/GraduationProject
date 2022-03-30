import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:frontend/common/tip.dart';
import 'package:go_router/go_router.dart';

import '../../../../../common/styles.dart';

class UnsubscribePage extends StatefulWidget {
  const UnsubscribePage({Key? key}) : super(key: key);

  @override
  State<UnsubscribePage> createState() => _UnsubscribePageState();
}

class _UnsubscribePageState extends State<UnsubscribePage> {
  var agreed = false;

  Future<String> _loadDispose() async =>
      await rootBundle.loadString('assets/protocols/dispose.txt');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColor.collAppBar,
        title: const Text(
          '账号注销',
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
            FutureBuilder(
              future: _loadDispose(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(bottom: 5),
                          child: Text(
                            '注销协议：',
                            style: TextStyle(
                              fontSize: 25,
                            ),
                          ),
                        ),
                        Text(snapshot.data! as String),
                      ],
                    ),
                  );
                } else {
                  return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: const Center(
                      child: SpinKitCubeGrid(
                        color: AppColor.primary,
                      ),
                    ),
                  );
                }
              },
            ),
            Column(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * 0.75,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Checkbox(
                        value: agreed,
                        onChanged: (agreed) {
                          setState(() {
                            this.agreed = agreed!;
                          });
                        },
                      ),
                      TextButton(
                        onPressed: () => setState(() => agreed = !agreed),
                        child: const Text(
                          '我已阅读并同意“注销协议“',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 13,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: MaterialButton(
                    onPressed: () {
                      if (!agreed) {
                        showTip(
                          msg: '请阅读并同意”注销协议“',
                          gravity: ToastGravity.CENTER,
                        );
                      }
                    },
                    color: AppColor.primary,
                    child: SizedBox(
                      width: MediaQuery.of(context).size.width * 0.75,
                      height: 45,
                      child: const Center(
                        child: Text(
                          '确认注销',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            fontSize: 17,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
