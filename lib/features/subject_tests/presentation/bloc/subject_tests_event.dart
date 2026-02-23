part of 'subject_tests_bloc.dart';

@immutable
sealed class SubjectTestsEvent {}

final class SubjectTestsStarted
    extends SubjectTestsEvent {

  final String username;
  final String password;

  SubjectTestsStarted({
    required this.username,
    required this.password,
  });
}

final class SubjectTestsCompleted
    extends SubjectTestsEvent {}