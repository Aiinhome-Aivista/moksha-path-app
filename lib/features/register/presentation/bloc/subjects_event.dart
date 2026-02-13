part of 'register_bloc.dart';

final class SubjectsFetched extends RegisterEvent {
  final int boardId;
  final int schoolId;
  final int classId;
  final String academicYear;

  SubjectsFetched({
    required this.boardId,
    required this.schoolId,
    required this.classId,
    required this.academicYear,
  });
}
