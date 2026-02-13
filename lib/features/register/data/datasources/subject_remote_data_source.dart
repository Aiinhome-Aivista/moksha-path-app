import 'package:flutter/material.dart';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/register/data/models/subject_model.dart';

abstract class SubjectRemoteDataSource {
  Future<List<SubjectModel>> fetchSubjects({
    required int boardId,
    required int schoolId,
    required int classId,
    required String academicYear,
  });
}

class SubjectRemoteDataSourceImpl implements SubjectRemoteDataSource {
  final DioClient dio;

  SubjectRemoteDataSourceImpl(this.dio);

  @override
  Future<List<SubjectModel>> fetchSubjects({
    required int boardId,
    required int schoolId,
    required int classId,
    required String academicYear,
  }) async {
    try {
      final response = await dio.dio.post(
        ApiEndPoints.subjects,
        data: {
          'board_name': boardId,
          'institute_name': schoolId,
          'class_name': classId,
          'academic_year': academicYear,
        },
      );
      debugPrint("debug subjects: ${response.data}");
      final List<dynamic> subjects = response.data['data']['subjects'] ?? [];
      return SubjectModel.fromJsonList(subjects);
    } catch (e) {
      throw e.toString();
    }
  }
}
