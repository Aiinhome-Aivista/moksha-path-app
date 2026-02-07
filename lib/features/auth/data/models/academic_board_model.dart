import 'package:moksha_path/core/helper/string_modifier.dart';
import 'package:moksha_path/features/auth/domain/entities/academicBoard.dart';

class AcademicBoardModel extends AcademicBoard {
  const AcademicBoardModel({
    required super.boardId,
    required super.boardName,
  });

  factory AcademicBoardModel.fromJson(Map<String, dynamic> json) {
    return AcademicBoardModel(
      boardId: json['id'],
      boardName: joinTheString(json['name']),
    );
  }
}