import 'package:flutter/material.dart';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/auth/data/models/role_model.dart';

abstract class RoleRemoteDataSource {
  Future<List<RoleModel>> fetchRoles();
}

class RoleRemoteDataSourceImpl implements RoleRemoteDataSource {
  final DioClient dio;

  RoleRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RoleModel>> fetchRoles() async {
    try {
      final response = await dio.dio.get(ApiEndPoints.roles);
      debugPrint("debug ${response.data}");

      final List data = response.data is List ? response.data : response.data['data'];

      return data.map((e) => RoleModel.fromJson(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
