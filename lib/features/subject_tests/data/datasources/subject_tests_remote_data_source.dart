import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import '../../data/models/subject_tests_model.dart';
import 'package:flutter/material.dart';

abstract class SubjectTestsRemoteDataSource {
  Future<List<SubjectTestsModel>> fetchSubjectTestss();
}

class SubjectTestsRemoteDataSourceImpl
    implements SubjectTestsRemoteDataSource {

  final DioClient dio;

  SubjectTestsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<SubjectTestsModel>> fetchSubjectTestss() async {

    try {

         final response = await dio.dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => SubjectTestsModel.fromJson(e))
        .toList();
      
    } catch (e) {

      throw e.toString();
      
    }
 
  }
}