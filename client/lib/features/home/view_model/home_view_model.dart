import 'package:client/core/services/shared_preferences_service.dart';
import 'package:client/features/home/models/category_model.dart';
import 'package:client/features/home/models/product_model.dart';
import 'package:client/features/home/repository/home_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_view_model.g.dart';

@riverpod
class HomeViewModel extends _$HomeViewModel {
  late SharedPreferencesService _sharedPreferencesService;

  @override
  build() {
    _sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
    return null;
  }
}

@riverpod
Future<List<CategoryModel>> getCategories(Ref ref) async {
  return await ref.watch(homeRepositoryProvider.notifier).getCategories();
}

@riverpod
Future<List<ProductModel>> getProducts(Ref ref) async {
  return await ref.watch(homeRepositoryProvider.notifier).getProducts();
}
