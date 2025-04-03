import 'package:client/core/services/shared_preferences_service.dart';
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
