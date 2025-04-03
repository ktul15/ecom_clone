import 'package:client/core/constants/preference_constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'shared_preferences_service.g.dart';

@Riverpod(keepAlive: true)
SharedPreferencesService sharedPreferencesService(Ref ref) {
  return SharedPreferencesService();
}

class SharedPreferencesService {
  late SharedPreferences _sharedPreferences;

  SharedPreferencesService();

  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String? token) async {
    if (token == null) {
      return;
    }
    await _sharedPreferences.setString(PreferenceConstants.token, token);
  }

  String? getToken() {
    return _sharedPreferences.getString(PreferenceConstants.token);
  }
}
