import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import '../../data/models/setting_model.dart';
import 'package:flutter/material.dart';

abstract class SettingRemoteDataSource {
  Future<List<SettingModel>> fetchSettings();
}

class SettingRemoteDataSourceImpl implements SettingRemoteDataSource {
  final DioClient dioClient;

  SettingRemoteDataSourceImpl(this.dioClient);

  @override
  Future<List<SettingModel>> fetchSettings() async {
    final response = await dioClient.dio.get(ApiEndPoints.academicmaster);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data.map((e) => SettingModel.fromJson(e)).toList();
  }
}
