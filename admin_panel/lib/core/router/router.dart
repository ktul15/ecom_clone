import 'package:admin_panel/core/router/route_paths.dart';
import 'package:admin_panel/features/auth/views/pages/sign_in_page.dart';
import 'package:admin_panel/features/home/views/home_page.dart';
import 'package:go_router/go_router.dart';

final loggedOutGoRouter = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const SignInPage();
      },
    ),
  ],
);

final gorouter = GoRouter(
  routes: [
    GoRoute(
      path: RoutePaths.home,
      builder: (context, state) {
        return const HomePage();
      },
    ),
    GoRoute(
      path: RoutePaths.signIn,
      builder: (context, state) {
        return const SignInPage();
      },
    ),
  ],
);
