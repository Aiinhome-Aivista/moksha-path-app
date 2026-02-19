import '../entities/learning_plan.dart';

abstract class LearningPlanRepository {
  Future<List<LearningPlan>> getLearningPlans();
}