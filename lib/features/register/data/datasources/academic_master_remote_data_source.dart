import 'package:flutter/material.dart';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/register/data/models/academic_item_model.dart';
import 'package:moksha_path/features/register/data/models/academic_year_model.dart';

abstract class AcademicMasterRemoteDataSource {
  Future<List<AcademicItemModel>> fetchBoards();
  Future<List<AcademicItemModel>> fetchSchools({required int boardId});
  Future<List<AcademicItemModel>> fetchClasses({
    required int boardId,
    required int schoolId,
  });
  Future<List<AcademicYearModel>> fetchYears({
    required int boardId,
    required int schoolId,
    required int classId,
  });
}

class AcademicMasterRemoteDataSourceImpl
    implements AcademicMasterRemoteDataSource {
  final DioClient dio;

  AcademicMasterRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AcademicItemModel>> fetchBoards() async {
    try {
      final response = await dio.dio.get(ApiEndPoints.academicMaster);
      debugPrint("debug boards: ${response.data}");
      final List<dynamic> data = response.data['data'] ?? [];
      return AcademicItemModel.fromJsonList(data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<AcademicItemModel>> fetchSchools({required int boardId}) async {
    try {
      final response = await dio.dio.get(
        ApiEndPoints.academicMaster,
        queryParameters: {'board_id': boardId},
      );
      debugPrint("debug schools: ${response.data}");
      final List<dynamic> data = response.data['data'] ?? [];
      return AcademicItemModel.fromJsonList(data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<AcademicItemModel>> fetchClasses({
    required int boardId,
    required int schoolId,
  }) async {
    try {
      final response = await dio.dio.get(
        ApiEndPoints.academicMaster,
        queryParameters: {'board_id': boardId, 'school_id': schoolId},
      );
      debugPrint("debug classes: ${response.data}");
      final List<dynamic> data = response.data['data'] ?? [];
      return AcademicItemModel.fromJsonList(data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<AcademicYearModel>> fetchYears({
    required int boardId,
    required int schoolId,
    required int classId,
  }) async {
    try {
      final response = await dio.dio.get(
        ApiEndPoints.academicMaster,
        queryParameters: {
          'board_id': boardId,
          'school_id': schoolId,
          'class_id': classId,
        },
      );
      debugPrint("debug years: ${response.data}");
      final List<dynamic> data = response.data['data'] ?? [];
      return AcademicYearModel.fromJsonList(data);
    } catch (e) {
      throw e.toString();
    }
  }
}
