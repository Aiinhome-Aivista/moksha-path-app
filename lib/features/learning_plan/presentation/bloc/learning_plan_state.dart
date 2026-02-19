part of 'learning_plan_bloc.dart';


@immutable
sealed class LearningPlanState {}

final class LearningPlanInitial extends LearningPlanState {}

final class LearningPlanLoading extends LearningPlanState {}
final class LearningPlanSuccess extends LearningPlanState {}

final class LearningPlanFailure extends LearningPlanState {}