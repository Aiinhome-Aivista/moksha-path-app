import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import '../../data/models/learning_plan_model.dart';
import 'package:flutter/material.dart';

abstract class LearningPlanRemoteDataSource {
  Future<List<LearningPlanModel>> fetchLearningPlans();
}

class LearningPlanRemoteDataSourceImpl
    implements LearningPlanRemoteDataSource {

  final DioClient dio;

  LearningPlanRemoteDataSourceImpl(this.dio);

  @override
  Future<List<LearningPlanModel>> fetchLearningPlans() async {

    try {

         final response = await dio.dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => LearningPlanModel.fromJson(e))
        .toList();
      
    } catch (e) {

      throw e.toString();
      
    }
 
  }
}