import 'package:client/core/services/shared_preferences_service.dart';
import 'package:client/features/auth/models/request/signup_request.dart';
import 'package:client/features/auth/models/response/user_model.dart';
import 'package:client/features/auth/repositories/auth_remote_repository.dart';
import 'package:fpdart/fpdart.dart' as fpdart;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_view_model.g.dart';

@riverpod
class AuthViewModel extends _$AuthViewModel {
  late AuthRemoteRepository _authRemoteRepository;
  late SharedPreferencesService _sharedPreferencesService;

  @override
  AsyncValue<UserModel>? build() {
    _authRemoteRepository = ref.watch(authRemoteRepositoryProvider);
    _sharedPreferencesService = ref.watch(sharedPreferencesServiceProvider);
    return null;
  }

  Future<void> signUp({required String email, required String password}) async {
    // Add your sign up logic here
    state = AsyncLoading();

    final res = await _authRemoteRepository.signup(
      signUpRequest: SignUpRequest(email: email, password: password),
    );

    final val = switch (res) {
      fpdart.Left(value: final l) =>
        state = AsyncError(l.message, StackTrace.current),
      fpdart.Right(value: final r) => signinSuccess(r),
    };
    // debugPrint("sign up value in view model: ${val.toString()}");
  }

  Future<AsyncData<UserModel>?> signinSuccess(UserModel user) async {
    await _sharedPreferencesService.setToken(user.token);
    return state = AsyncData(user);
  }
}
