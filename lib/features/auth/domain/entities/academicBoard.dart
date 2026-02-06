import 'package:equatable/equatable.dart';

class AcademicBoard extends Equatable{
  final int boardId;
  final String boardName;

  const AcademicBoard({
    required this.boardId,
    required this.boardName,
  });
  @override
  List<Object?> get props=> [boardId, boardName];

} 