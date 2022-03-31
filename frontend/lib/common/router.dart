import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screen.dart';

class AppRouter {
  static const auth = '/';
  static const main = '/main';
  static const post = '/post';
  static const scan = '/scan';
  static const coll = '/coll';
  static const expo = '/expo';
  static const detail = '/detail';
  static const settings = '/settings';
  static const data = '/data';
  static const chgpswd = '/chgpswd';
  static const manage = '/manage';
  static const name = '/name';
  static const chgemail = '/chgemail';
  static const unsubscribe = '/unsubscribe';
}

final GoRouter router = GoRouter(routes: <GoRoute>[
  GoRoute(
    path: AppRouter.auth,
    builder: (BuildContext context, GoRouterState state) => const AuthPage(),
  ),
  GoRoute(
    path: AppRouter.main,
    builder: (BuildContext context, GoRouterState state) => const MainPage(),
  ),
  GoRoute(
    path: AppRouter.post,
    builder: (BuildContext context, GoRouterState state) => PostPage(
      query: state.queryParams['query'],
      from: state.queryParams['from'],
    ),
  ),
  GoRoute(
    path: AppRouter.scan,
    builder: (BuildContext context, GoRouterState state) => const ScanPage(),
  ),
  GoRoute(
    path: AppRouter.coll,
    builder: (BuildContext context, GoRouterState state) => const CollPage(),
  ),
  GoRoute(
    path: AppRouter.expo,
    builder: (BuildContext context, GoRouterState state) => const ExpoPage(),
  ),
  GoRoute(
    path: AppRouter.detail,
    builder: (BuildContext context, GoRouterState state) =>
        DetailPage(index: state.queryParams['index']!),
  ),
  GoRoute(
    path: AppRouter.settings,
    builder: (BuildContext context, GoRouterState state) =>
        const SettingsPage(),
  ),
  GoRoute(
    path: AppRouter.chgpswd,
    builder: (BuildContext context, GoRouterState state) => const ChgPswdPage(),
  ),
  GoRoute(
    path: AppRouter.data,
    builder: (BuildContext context, GoRouterState state) => const DataPage(),
  ),
  GoRoute(
    path: AppRouter.manage,
    builder: (BuildContext context, GoRouterState state) => const ManagePage(),
  ),
  GoRoute(
    path: AppRouter.name,
    builder: (BuildContext context, GoRouterState state) => const NamePage(),
  ),
  GoRoute(
    path: AppRouter.chgemail,
    builder: (BuildContext context, GoRouterState state) =>
        const ChgemailPage(),
  ),
  GoRoute(
    path: AppRouter.unsubscribe,
    builder: (BuildContext context, GoRouterState state) =>
        const UnsubscribePage(),
  ),
]);
