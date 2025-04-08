import 'package:client/core/providers/current_user_notifier.dart';
import 'package:client/core/router/route_paths.dart';
import 'package:client/core/theme/app_pallette.dart';
import 'package:client/features/auth/views/pages/welcome_page.dart';
import 'package:client/features/home/view_model/home_view_model.dart';
import 'package:client/features/home/views/widgets/categories_list_view.dart';
import 'package:client/features/home/views/widgets/location_section.dart';
import 'package:client/features/home/views/widgets/products_grid_view.dart';
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
    final productsAsyncValue = ref.watch(getProductsProvider);

    return CustomScrollView(
      physics: ClampingScrollPhysics(),
      slivers: [
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 100.0,
            maxHeight: 100.0,
            child: StickySearchFieldAndScanSection(),
          ),
        ),
        // SliverToBoxAdapter(child: StickySearchFieldAndScanSection()),
        SliverPersistentHeader(
          pinned: true,
          delegate: _SliverAppBarDelegate(
            minHeight: 40.0,
            maxHeight: 40.0,
            child: LocationSection(),
          ),
        ),
        // SliverToBoxAdapter(child: LocationSection()),
        categoriesAsyncValue.when(
          data: (categories) {
            if (categories.isEmpty) {
              return SliverToBoxAdapter(child: SizedBox.shrink());
            }
            return SliverToBoxAdapter(
              child: CategoriesListView(categories: categories),
            );
          },
          error: (_, _) {
            return SliverToBoxAdapter(child: SizedBox.shrink());
          },
          loading:
              () => SliverToBoxAdapter(
                child: CircularProgressIndicator.adaptive(),
              ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 8)),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Text(
              "Discover products for you",
              style: TextStyle(
                fontSize: 18,
                color: Pallete.textColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 8)),
        productsAsyncValue.when(
          data: (products) {
            if (products.isEmpty) {
              return SliverToBoxAdapter(child: SizedBox.shrink());
            }
            return ProductsGridView(products: products);
          },
          error: (_, _) {
            return SliverToBoxAdapter(child: SizedBox.shrink());
          },
          loading:
              () => SliverToBoxAdapter(
                child: CircularProgressIndicator.adaptive(),
              ),
        ),
        SliverToBoxAdapter(child: SizedBox(height: 8)),
      ],
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate({
    required this.minHeight,
    required this.maxHeight,
    required this.child,
  });

  final double minHeight;
  final double maxHeight;
  final Widget child;

  @override
  double get minExtent => minHeight;

  @override
  double get maxExtent => maxHeight;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return SizedBox.expand(child: child);
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
