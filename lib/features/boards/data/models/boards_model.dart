import '../../domain/entities/boards.dart';

class BoardsModel extends Boards {
  const BoardsModel({required super.id});

  factory BoardsModel.fromJson(Map<String, dynamic> json) {
    return BoardsModel(
      id: json['id'],
    );
  }
}