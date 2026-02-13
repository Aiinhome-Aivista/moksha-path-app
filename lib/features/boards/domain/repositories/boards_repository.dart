import '../entities/boards.dart';

abstract class BoardsRepository {
  Future<List<Boards>> getBoardss();
}