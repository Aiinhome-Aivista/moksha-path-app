part of 'study_materials_bloc.dart';


@immutable
sealed class StudyMaterialsState {}

final class StudyMaterialsInitial extends StudyMaterialsState {}

final class StudyMaterialsLoading extends StudyMaterialsState {}
final class StudyMaterialsSuccess extends StudyMaterialsState {}

final class StudyMaterialsFailure extends StudyMaterialsState {}