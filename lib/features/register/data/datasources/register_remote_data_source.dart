import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import '../../data/models/register_model.dart';
import 'package:flutter/material.dart';

abstract class RegisterRemoteDataSource {
  Future<List<RegisterModel>> fetchRegisters();
}

class RegisterRemoteDataSourceImpl
    implements RegisterRemoteDataSource {

  final DioClient dio;

  RegisterRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RegisterModel>> fetchRegisters() async {

    try {

         final response = await dio.dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => RegisterModel.fromJson(e))
        .toList();
      
    } catch (e) {

      throw e.toString();
      
    }
 
  }
}