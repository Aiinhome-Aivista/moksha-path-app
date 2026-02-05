import 'package:moksha_path/core/network/api_endpoints.dart';
import '../../data/models/auth_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class AuthRemoteDataSource {
  Future<List<AuthModel>> fetchAuths();
}

class AuthRemoteDataSourceImpl
    implements AuthRemoteDataSource {

  final Dio dio;

  AuthRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AuthModel>> fetchAuths() async {
    final response = await dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => AuthModel.fromJson(e))
        .toList();
  }
}