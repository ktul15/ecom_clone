import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/core/router/route_paths.dart';
import 'package:client/features/auth/views/pages/welcome_page.dart';
import 'package:client/features/home/view_model/home_view_model.dart';
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

    final categoriesAsyncValue = ref.watch(getCategoriesProvider);

    return Column(
      children: [
        StickySearchFieldAndScanSection(),
        LocationSection(),
        categoriesAsyncValue.when(
          data: (categories) {
            if (categories.isEmpty) {
              return SizedBox.shrink();
            }
            return Container(
              height: MediaQuery.of(context).size.height * 0.12,
              child: ListView.builder(
                padding: EdgeInsets.only(top: 16, bottom: 12),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  final category = categories[index];
                  return InkWell(
                    onTap: () {
                      // context.pushNamed(RoutePaths.category, extra: category);
                    },
                    child: Container(
                      height: MediaQuery.of(context).size.height * 0.12,
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 0,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(12),
                            child: Image.asset(
                              category.image,
                              cacheWidth: 50,
                              cacheHeight: 50,
                              fit: BoxFit.cover,
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(category.name),
                        ],
                      ),
                    ),
                  );
                },
              ),
            );
          },
          error: (_, _) {
            return SizedBox.shrink();
          },
          loading: () => CircularProgressIndicator.adaptive(),
        ),
        SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
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
