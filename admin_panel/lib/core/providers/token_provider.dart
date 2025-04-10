import 'package:admin_panel/core/constants/keys.dart';
import 'package:admin_panel/core/providers/secure_storage_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'token_provider.g.dart';

@riverpod
class TokenManager extends _$TokenManager {
  late FlutterSecureStorage secureStorage;
  @override
  String? build() {
    secureStorage = ref.read(secureStorageProvider);
    return null;
  }

  setToken(String token) async {
    await secureStorage.write(key: Keys.token, value: token);
  }

  Future<String?> getToken() async {
    return await secureStorage.read(key: Keys.token);
  }
}
