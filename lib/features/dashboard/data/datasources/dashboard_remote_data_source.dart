import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import '../../data/models/dashboard_model.dart';
import 'package:flutter/material.dart';

abstract class DashboardRemoteDataSource {
  Future<List<DashboardModel>> fetchDashboards();
}

class DashboardRemoteDataSourceImpl
    implements DashboardRemoteDataSource {

  final DioClient dio;

  DashboardRemoteDataSourceImpl(this.dio);

  @override
  Future<List<DashboardModel>> fetchDashboards() async {

    try {

         final response = await dio.dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => DashboardModel.fromJson(e))
        .toList();
      
    } catch (e) {

      throw e.toString();
      
    }
 
  }
}