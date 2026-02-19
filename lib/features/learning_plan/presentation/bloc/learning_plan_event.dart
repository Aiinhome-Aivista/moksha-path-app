part of 'learning_plan_bloc.dart';

@immutable
sealed class LearningPlanEvent {}

final class LearningPlanStarted
    extends LearningPlanEvent {

  final String username;
  final String password;

  LearningPlanStarted({
    required this.username,
    required this.password,
  });
}

final class LearningPlanCompleted
    extends LearningPlanEvent {}