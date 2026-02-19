import '../entities/learning_plan.dart';
import '../repositories/learning_plan_repository.dart';

class GetLearningPlan {
  final LearningPlanRepository repository;

  GetLearningPlan(this.repository);

  Future<List<LearningPlan>> call() {
    return repository.getLearningPlans();
  }
}