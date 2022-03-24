import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'common/router.dart';
import 'common/styles.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
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
