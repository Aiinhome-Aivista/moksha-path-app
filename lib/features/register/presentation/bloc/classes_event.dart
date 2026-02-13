part of 'register_bloc.dart';

final class ClassesFetched extends RegisterEvent {
  final int boardId;
  final int schoolId;

  ClassesFetched({required this.boardId, required this.schoolId});
}
