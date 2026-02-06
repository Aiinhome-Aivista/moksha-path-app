import 'package:flutter/material.dart';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/auth/data/models/academic_board_model.dart';

abstract class AcademicBoardRemoteDataSource {
  Future<List<AcademicBoardModel>> fetchAcademicBoards();
}

class AcademicBoardRemoteDataSourceImpl
    implements AcademicBoardRemoteDataSource {
  final DioClient dio;

  AcademicBoardRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AcademicBoardModel>> fetchAcademicBoards() async {
    try {
      final response = await dio.dio.get(ApiEndPoints.academicMaster);
      debugPrint("debug ${response.data['data']}");

      final List data = response.data['data'];

      return data.map((e) => AcademicBoardModel.fromJson(e)).toList();
    } catch (e) {
      throw e.toString();
    }
  }
}
