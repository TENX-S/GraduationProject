import 'dart:async';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'common/router.dart';
import 'common/styles.dart';
import 'services/client.dart';

void main() {
  var widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const InitStateless(
    init: confirmHost,
    child: App(),
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

class InitStateless extends StatefulWidget {
  final Function init;
  final Widget child;

  const InitStateless({Key? key, required this.init, required this.child})
      : super(key: key);

  @override
  State<InitStateless> createState() => _InitStatelessState();
}

class _InitStatelessState extends State<InitStateless> {
  @override
  initState() {
    widget.init();
    Future.delayed(const Duration(seconds: 1), FlutterNativeSplash.remove);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
