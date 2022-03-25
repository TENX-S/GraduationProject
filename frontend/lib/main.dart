import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/router.dart';
import 'common/styles.dart';
import 'services/client.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const InitWrapper(
    child: App(),
    onInit: confirmHost,
  ));
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) => MaterialApp.router(
        debugShowCheckedModeBanner: false,
        title: '博物馆',
        theme: ThemeData(
          fontFamily: 'NSSC',
          brightness: MediaQueryData.fromWindow(window).platformBrightness,
          primaryColor: AppColor.primary,
          primarySwatch: AppColor.primarySwatch,
        ),
        routerDelegate: router.routerDelegate,
        routeInformationParser: router.routeInformationParser,
      );
}

class InitWrapper extends StatefulWidget {
  final Function onInit;
  final Widget child;

  const InitWrapper({Key? key, required this.onInit, required this.child})
      : super(key: key);

  @override
  State<InitWrapper> createState() => _InitWrapperState();
}

class _InitWrapperState extends State<InitWrapper> {
  @override
  void initState() {
    widget.onInit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
