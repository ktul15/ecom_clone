import 'package:admin_panel/features/auth/models/request/login_request.dart';
import 'package:admin_panel/features/auth/repository/auth_repository.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRepository _authRepository;
  @override
  AsyncValue? build() {
    _authRepository = ref.watch(authRepositoryProvider);
    return null;
  }

  Future<void> login(String email, String password) async {
    // Implement login logic here
    state = AsyncLoading();

    final res = await _authRepository.login(
      loginRequest: LoginRequest(email: email, password: password),
    );

    final val = switch (res) {
      Left(value: final l) => state = AsyncError(l.message, StackTrace.current),
      Right(value: final r) => state = AsyncData(r),
    };
  }
}
