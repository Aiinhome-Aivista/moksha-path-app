import 'package:moksha_path/core/network/api_endpoints.dart';
import '../../data/models/{{name}}_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class {{name.pascalCase()}}RemoteDataSource {
  Future<List<{{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}s();
}

class {{name.pascalCase()}}RemoteDataSourceImpl
    implements {{name.pascalCase()}}RemoteDataSource {

  final Dio dio;

  {{name.pascalCase()}}RemoteDataSourceImpl(this.dio);

  @override
  Future<List<{{name.pascalCase()}}Model>> fetch{{name.pascalCase()}}s() async {
    final response = await dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => {{name.pascalCase()}}Model.fromJson(e))
        .toList();
  }
}