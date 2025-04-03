import 'package:client/core/router/route_paths.dart';
import 'package:client/core/router/temp_pages.dart';
import 'package:client/features/auth/views/pages/sign_in_or_create_account_page.dart';
import 'package:client/features/auth/views/pages/welcome_page.dart';
import 'package:client/features/bottom_navigatin_bar/view/bottom_navigation_bar.dart';
import 'package:client/features/home/views/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// private navigators
final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorAKey = GlobalKey<NavigatorState>(debugLabel: 'shellA');
final _shellNavigatorBKey = GlobalKey<NavigatorState>(debugLabel: 'shellB');
final _shellNavigatorCKey = GlobalKey<NavigatorState>(debugLabel: 'shellC');
final _shellNavigatorDKey = GlobalKey<NavigatorState>(debugLabel: 'shellD');
final _shellNavigatorEKey = GlobalKey<NavigatorState>(debugLabel: 'shellE');

final GoRouter router = GoRouter(
  initialLocation: RoutePaths.home,
  navigatorKey: _rootNavigatorKey,
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        // the UI shell
        return ScaffoldWithNestedNavigation(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          navigatorKey: _shellNavigatorAKey,
          routes: [
            GoRoute(
              path: RoutePaths.home,
              name: RoutePaths.home,
              builder: (BuildContext context, GoRouterState state) {
                final extraData = state.extra as Map<String, bool>?;
                return HomePage(
                  fromContinue: extraData?["fromContinue"] ?? false,
                );
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorBKey,
          routes: [
            GoRoute(
              path: RoutePaths.account,
              name: RoutePaths.account,
              builder: (BuildContext context, GoRouterState state) {
                return AccountsPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorCKey,
          routes: [
            GoRoute(
              path: RoutePaths.pay,
              name: RoutePaths.pay,
              builder: (BuildContext context, GoRouterState state) {
                return PayPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorDKey,
          routes: [
            GoRoute(
              path: RoutePaths.cart,
              name: RoutePaths.cart,
              builder: (BuildContext context, GoRouterState state) {
                return CartPage();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          navigatorKey: _shellNavigatorEKey,
          routes: [
            GoRoute(
              path: RoutePaths.settings,
              name: RoutePaths.settings,
              builder: (BuildContext context, GoRouterState state) {
                return SettingsPage();
              },
              routes: [
                GoRoute(
                  path: RoutePaths.settingsDetails,
                  name: RoutePaths.settingsDetails,
                  builder: (BuildContext context, GoRouterState state) {
                    return SettingsDetailsPage();
                  },
                ),
              ],
            ),
          ],
        ),
      ],
    ),
    // GoRoute(
    //   path: RoutePaths.home,
    //   name: RoutePaths.home,
    //   builder: (BuildContext context, GoRouterState state) {
    //     final extraData = state.extra as Map<String, bool>?;
    //     return HomePage(fromContinue: extraData?["fromContinue"] ?? false);
    //   },
    // ),
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
