part of 'register_bloc.dart';

final class YearsFetched extends RegisterEvent {
  final int boardId;
  final int schoolId;
  final int classId;

  YearsFetched({
    required this.boardId,
    required this.schoolId,
    required this.classId,
  });
}
