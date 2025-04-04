import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/core/router/route_paths.dart';
import 'package:client/features/auth/views/pages/welcome_page.dart';
import 'package:client/features/home/views/widgets/location_section.dart';
import 'package:client/features/home/views/widgets/sticky_search_field_scan_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key, required this.fromContinue});

  final bool fromContinue;

  static get route => RoutePaths.home;

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final token = ref.read(currentUserNotifierProvider)?.token;
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        if (token == null || token == "") {
          context.goNamed(WelcomePage.route);
        }
      }
    });
    return Column(
      children: [
        StickySearchFieldAndScanSection(),
        LocationSection(),
        Expanded(
          child: ListView.builder(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            itemBuilder: (context, index) {
              return Text("index: $index");
            },
          ),
        ),
      ],
    );
  }
}
