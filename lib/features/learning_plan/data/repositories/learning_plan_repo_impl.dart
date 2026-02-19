import '../../domain/entities/learning_plan.dart';
import '../../domain/repositories/learning_plan_repository.dart';
import '../datasources/learning_plan_remote_data_source.dart';
import '../models/learning_plan_model.dart';

class LearningPlanRepoImpl implements LearningPlanRepository {
  final LearningPlanRemoteDataSource remote;

  LearningPlanRepoImpl(this.remote);

  @override
  Future<List<LearningPlan>> getLearningPlans() async {

    try {

       final data = await remote.fetchLearningPlans();
    return data.map((e) => LearningPlanModel.fromJson(e as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw e.toString();
    }
   
  }
}