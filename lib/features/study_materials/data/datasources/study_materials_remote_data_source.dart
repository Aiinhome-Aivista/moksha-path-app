import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import '../../data/models/study_materials_model.dart';
import 'package:flutter/material.dart';

abstract class StudyMaterialsRemoteDataSource {
  Future<List<StudyMaterialsModel>> fetchStudyMaterialss();
}

class StudyMaterialsRemoteDataSourceImpl
    implements StudyMaterialsRemoteDataSource {

  final DioClient dio;

  StudyMaterialsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<StudyMaterialsModel>> fetchStudyMaterialss() async {

    try {

         final response = await dio.dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => StudyMaterialsModel.fromJson(e))
        .toList();
      
    } catch (e) {

      throw e.toString();
      
    }
 
  }
}