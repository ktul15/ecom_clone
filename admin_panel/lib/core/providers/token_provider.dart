import 'package:admin_panel/core/constants/keys.dart';
import 'package:admin_panel/core/providers/secure_storage_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_provider.g.dart';

@riverpod
class TokenManager extends _$TokenManager {
  late FlutterSecureStorage secureStorage;
  
  @override
  Future<String?> build() async {
    secureStorage = ref.read(secureStorageProvider);
    return await getToken();
  }

  Future<void> setToken(String token) async {
    await secureStorage.write(key: Keys.token, value: token);
    // Update the state with the new token
    state = AsyncData(token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: Keys.token);
  }
  
  Future<void> clearToken() async {
    await secureStorage.delete(key: Keys.token);
    state = const AsyncData(null);
  }
}
