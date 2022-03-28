import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../screens/screen.dart';

class AppRouter {
  static const auth = '/';
  static const main = '/main';
  static const post = '/post';
  static const scan = '/scan';
  static const coll = '/coll';
  static const settings = '/settings';
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
    path: AppRouter.settings,
    builder: (BuildContext context, GoRouterState state) => const AuthPage(),
  ),
]);
