import '../../domain/entities/learning_plan.dart';

class LearningPlanModel extends LearningPlan {
  const LearningPlanModel({required super.id});

  factory LearningPlanModel.fromJson(Map<String, dynamic> json) {
    return LearningPlanModel(
      id: json['id'],
    );
  }
}