// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_view_model.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$getCategoriesHash() => r'5fb4c715338aa4726a7f0db62a266159f2d5367d';

/// See also [getCategories].
@ProviderFor(getCategories)
final getCategoriesProvider =
    AutoDisposeFutureProvider<List<CategoryModel>>.internal(
      getCategories,
      name: r'getCategoriesProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$getCategoriesHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef GetCategoriesRef = AutoDisposeFutureProviderRef<List<CategoryModel>>;
String _$homeViewModelHash() => r'509b5edea7b7f4f3b9f1e7fa3a798c7432c215ce';

/// See also [HomeViewModel].
@ProviderFor(HomeViewModel)
final homeViewModelProvider =
    AutoDisposeNotifierProvider<HomeViewModel, Object?>.internal(
      HomeViewModel.new,
      name: r'homeViewModelProvider',
      debugGetCreateSourceHash:
          const bool.fromEnvironment('dart.vm.product')
              ? null
              : _$homeViewModelHash,
      dependencies: null,
      allTransitiveDependencies: null,
    );

typedef _$HomeViewModel = AutoDisposeNotifier<Object?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
