import 'package:equatable/equatable.dart';

class AcademicBoard extends Equatable{
  final int boardId;
  final String boardName;
  final String userName;
  final String boardType;

  const AcademicBoard({
     this.boardId = 0,
     this.boardName = '',
     this.userName = '',
     this.boardType = '',
  });
  @override
  List<Object?> get props=> [boardId, boardName];

} 