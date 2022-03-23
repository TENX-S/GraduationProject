import 'package:frontend/utils/styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login/flutter_login.dart';
import 'package:email_validator/email_validator.dart';
import '../models/app_routes.dart';
import '../utils/tip.dart';
import '../models/user.dart';
import '../models/client.dart';
import '../grpc/auth.pb.dart';
import '../grpc/auth.pbgrpc.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  DateTime? currentBackPressTime;
  final _authClient = AuthClient(serverAddr: serverAddr, serverPort: serverPort);

  Future<bool> _onWillPop() {
    DateTime now = DateTime.now();
    if (currentBackPressTime == null ||
        now.difference(currentBackPressTime!) > const Duration(seconds: 2)) {
      currentBackPressTime = now;
      showTip(msg: '再按一次返回键退出');
      return Future.value(false);
    }
    return Future.value(true);
  }

  Future<String?> _onSignUp(LoginData input) async {
    final user = User(
      email: input.name,
      password: input.password,
    );
    late final AuthReply resp;
    try {
      resp = await _authClient.onSignUp(user);
    } catch (e) {
      showTip(msg: e.toString());
    }

    if (!resp.success) {
      switch (resp.error) {
        case AuthError.DUPLICATED_NAME:
          return '用户名已存在，请直接登录';
        case AuthError.UNKNOWN:
          return '未知的错误';
        case AuthError.MISMATCHED_PASSWORD:
        case AuthError.NONEXISTENT_USER:
          break;
      }
    }
    return null;
  }

  Future<String?> _onLogin(LoginData input) async {
    final user = User(
      email: input.name,
      password: input.password,
    );
    late final AuthReply resp;
    try {
      resp = await _authClient.onLogin(user);
    } catch (e) {
      showTip(msg: e.toString());
    }

    if (!resp.success) {
      switch (resp.error) {
        case AuthError.NONEXISTENT_USER:
          return '用户名不存在';
        case AuthError.MISMATCHED_PASSWORD:
          return '密码错误';
        case AuthError.UNKNOWN:
          return '未知的错误';
        case AuthError.DUPLICATED_NAME:
          break;
      }
    }
    currentUser = user;
    return null;
  }

  Future<String?> _onRecoverPassword(String _) async {
    return null;
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: _onWillPop,
      child: FlutterLogin(
        title: 'Museum',
        hideForgotPasswordButton: true,
        loginAfterSignUp: false,
        onSignup: _onSignUp,
        onLogin: _onLogin,
        onRecoverPassword: _onRecoverPassword,
        onSubmitAnimationCompleted: () => Navigator.of(context).pushReplacementNamed(AppRoutes.mainPage),
        messages: LoginMessages(
          userHint: '用户名',
          passwordHint: '密码',
          confirmPasswordHint: '重复输入密码',
          loginButton: '登录',
          signupButton: '注册',
          confirmPasswordError: '密码不匹配',
          flushbarTitleError: '😅😅😅',
          flushbarTitleSuccess: '🎉🎉🎉',
          signUpSuccess: '注册成功',
        ),
        theme: LoginTheme(
          primaryColor: AppColor.authPrimary,
          accentColor: AppColor.authAccent,
          buttonTheme: const LoginButtonTheme(
            splashColor: AppColor.authPrimary,
          ),
          titleStyle: const TextStyle(
            color: AppColor.authTitle,
            fontFamily: AppFont.ascii,
            fontWeight: AppFont.authWeight,
            wordSpacing: AppFont.authBannerWordSpacing,
            fontSize: AppFont.authBannerSize,
          ),
          cardTheme: const CardTheme(
            color: AppColor.authCardColor,
          ),
        ),
        userValidator: (email) {
          if (!EmailValidator.validate(email!)) {
            return '用户名格式不正确';
          }
          return null;
        },
        passwordValidator: (password) {
          if (password!.isEmpty || password.length < 6) {
            return '密码格式不正确';
          }
          return null;
        },
      ),
    );
  }
}
