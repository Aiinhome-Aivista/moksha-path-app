part of 'study_materials_bloc.dart';

@immutable
sealed class StudyMaterialsEvent {}

final class StudyMaterialsStarted
    extends StudyMaterialsEvent {

  final String username;
  final String password;

  StudyMaterialsStarted({
    required this.username,
    required this.password,
  });
}

final class StudyMaterialsCompleted
    extends StudyMaterialsEvent {}