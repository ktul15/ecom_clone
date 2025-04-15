import 'package:admin_panel/core/network/app_failure.dart';
import 'package:admin_panel/core/network/server_constants.dart';
import 'package:admin_panel/core/providers/dio_provider.dart';
import 'package:admin_panel/features/auth/models/request/login_request.dart';
import 'package:admin_panel/features/auth/models/response/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
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

  Future<Either<AppFailure, UserModel>> login({
    required LoginRequest loginRequest,
  }) async {
    try {
      final response = await _dio.post(
        "${ServerConstants.serverBaseUrl}${ServerConstants.login}",
        data: loginRequest.toJson(),
      );

      final responseMap = response.data as Map<String, dynamic>;

      if (response.statusCode!.isNotEqualTo([200, 201])) {
        if (response.data is Map<String, dynamic> &&
            (response.data as Map<String, dynamic>).containsKey("error")) {
          return Left(AppFailure(response.data['error'] as String));
        } else {
          return Left(AppFailure('An error occurred'));
        }
      }

      UserModel user = UserModel.fromJson(response.data["user"]);

      return Right(user.copyWith(token: response.data["token"]));
    } on DioException catch (e) {
      debugPrint("Exception: $e");
      if (e.type == DioExceptionType.connectionError) {
        return Left(AppFailure("Please check your internet connection."));
      }
      return Left(AppFailure(e.message ?? 'An error occurred'));
      // }
      // on Exception catch (e) {
      //   debugPrint("Exception: $e");
      //   return Left(AppFailure(e.toString()));
      // } on TypeError catch (e) {
      //   debugPrint("TypeError: $e");
      //   return Left(AppFailure("Something went wrong. Please try again."));
    } catch (e) {
      return Left(AppFailure("Something went wrong. Please try again."));
    }
  }
}

extension IntExtension on int {
  bool isNotEqualTo(List<int> values) {
    for (int value in values) {
      if (this == value) {
        return false;
      }
    }
    return true;
  }
}
