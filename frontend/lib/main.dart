import 'dart:ui';
import 'models/app_routes.dart';
import 'pages/pages.dart';
import 'utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '博物馆',
      theme: ThemeData(
        fontFamily: AppFont.chinese,
        brightness: MediaQueryData.fromWindow(window).platformBrightness,
        primaryColor: AppColor.primary,
        primarySwatch: AppColor.primarySwatch,
      ),
      routes: {
        AppRoutes.authPage: (context) => const AuthPage(),
        AppRoutes.mainPage: (context) => const MainPage(),
        AppRoutes.homePage: (context) => const HomePage(),
        AppRoutes.postPage: (context) => const PostPage(),
        AppRoutes.userPage: (context) => const UserPage(),
      },
    );
  }
}
