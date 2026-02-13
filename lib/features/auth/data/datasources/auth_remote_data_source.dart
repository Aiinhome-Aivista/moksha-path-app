import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/auth/data/models/login_user_model.dart';
import 'package:flutter/material.dart';

abstract class AuthRemoteDataSource {
  Future<LoginUserModel> register({
    required int roleId,
    required String username,
    required String fullName,
    required String email,
    required String mobile,
  });
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<LoginUserModel> register({
    required int roleId,
    required String username,
    required String fullName,
    required String email,
    required String mobile,
  }) async {
    try {
      final response = await dio.dio.post(
        ApiEndPoints.registration,
        data: {
          'role_id': roleId,
          'username': username,
          'full_name': fullName,
          'email': email,
          'mobile': mobile,
        },
      );
      debugPrint("debug register: ${response.data}");
      return LoginUserModel.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }
}
