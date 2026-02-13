import 'package:flutter/material.dart';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/register/data/models/username_check_model.dart';

abstract class UsernameCheckRemoteDataSource {
  Future<UsernameCheckModel> checkUsername(String username);
}

class UsernameCheckRemoteDataSourceImpl
    implements UsernameCheckRemoteDataSource {
  final DioClient dio;

  UsernameCheckRemoteDataSourceImpl(this.dio);

  @override
  Future<UsernameCheckModel> checkUsername(String username) async {
    try {
      final response = await dio.dio.post(
        ApiEndPoints.usernameCheck,
        data: {'username': username},
      );
      debugPrint("debug ${response.data}");
      return UsernameCheckModel.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }
}
