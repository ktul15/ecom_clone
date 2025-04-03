import 'dart:io';

import 'package:client/core/models/app_failure.dart';
import 'package:client/core/network/dio_client.dart';
import 'package:client/core/network/server_constants.dart';
import 'package:client/features/auth/models/request/signup_request.dart';
import 'package:client/features/auth/models/response/signup_response.dart';
import 'package:client/features/auth/models/response/user_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:fpdart/fpdart.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_remote_repository.g.dart';

@riverpod
AuthRemoteRepository authRemoteRepository(Ref ref) {
  final dio = ref.watch(dioProvider);
  return AuthRemoteRepository(dio);
}

class AuthRemoteRepository {
  final Dio _dio;

  AuthRemoteRepository(this._dio);
  Future<Either<AppFailure, UserModel>> signup({
    required SignUpRequest signUpRequest,
  }) async {
    try {
      // Call API to register
      final response = await _dio.post(
        '${ServerConstants.serverBaseUrl}${ServerConstants.serverAuthBaseUrl}${ServerConstants.signin}',
        data: signUpRequest.toJson(),
      );
      debugPrint("response.data: ${response.data}");
      debugPrint("st: ${response.statusCode.toString()}");
      if (response.statusCode != 201 && response.statusCode != 200) {
        return Left(AppFailure(response.data['error'] as String));
      }

      SignupResponse signupResponse = SignupResponse.fromJson(response.data);
      return Right(signupResponse.user.copyWith(token: signupResponse.token));
    } on SocketException catch (e) {
      debugPrint("SocketException: ${e.toString()}");
      return Left(
        AppFailure(
          "Something went wrong. Please check your internet connection.",
        ),
      );
    } on DioException catch (e) {
      return Left(AppFailure("Something went wrong."));
    } catch (e) {
      debugPrint(e.toString());
      return Left(AppFailure(e.toString()));
    }
  }
}
