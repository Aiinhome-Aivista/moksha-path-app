part of 'subject_tests_bloc.dart';


@immutable
sealed class SubjectTestsState {}

final class SubjectTestsInitial extends SubjectTestsState {}

final class SubjectTestsLoading extends SubjectTestsState {}
final class SubjectTestsSuccess extends SubjectTestsState {}

final class SubjectTestsFailure extends SubjectTestsState {}