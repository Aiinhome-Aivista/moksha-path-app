import 'package:moksha_path/core/network/api_endpoints.dart';
import '../../data/models/setting_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

abstract class SettingRemoteDataSource {
  Future<List<SettingModel>> fetchSettings();
}

class SettingRemoteDataSourceImpl
    implements SettingRemoteDataSource {

  final Dio dio;

  SettingRemoteDataSourceImpl(this.dio);

  @override
  Future<List<SettingModel>> fetchSettings() async {
    final response = await dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => SettingModel.fromJson(e))
        .toList();
  }
}