import 'package:admin_panel/core/network/app_failure.dart';
import 'package:admin_panel/core/providers/dio_provider.dart';
import 'package:admin_panel/features/auth/models/request/login_request.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_repository.g.dart';

@riverpod
AuthRepository authRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthRepository(dio);
}

class AuthRepository {
  final Dio _dio;

  const AuthRepository(this._dio);

  Future<Either<AppFailure, String>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await _dio.post(
        '/auth/login',
        data: loginRequest.toJson(),
      );

      if (response.statusCode == 200) {
        return Right(response.data['token']);
      } else {
        return Left(AppFailure('Login failed'));
      }
    } on DioError catch (e) {
      return Left(AppFailure(e.message ?? 'An error occurred'));
    }
  }
}
