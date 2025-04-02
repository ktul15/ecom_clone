import 'package:client/core/router/route_paths.dart';
import 'package:client/features/auth/views/pages/sign_in_or_create_account_page.dart';
import 'package:client/features/auth/views/pages/welcome_page.dart';
import 'package:client/features/home/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final GoRouter router = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.home,
      name: RoutePaths.home,
      builder: (BuildContext context, GoRouterState state) {
        final extraData = state.extra as Map<String, bool>?;
        return HomePage(fromContinue: extraData?["fromContinue"] ?? false);
      },
    ),
    GoRoute(
      path: RoutePaths.welcome,
      name: RoutePaths.welcome,
      builder: (BuildContext context, GoRouterState state) {
        return const WelcomePage();
      },
      routes: [
        GoRoute(
          path: RoutePaths.signIn,
          name: RoutePaths.signIn,
          builder: (BuildContext context, GoRouterState state) {
            return const SignInOrCreateAccountPage();
          },
        ),
      ],
    ),
  ],
);
