import '../entities/boards.dart';
import '../repositories/boards_repository.dart';

class GetBoards {
  final BoardsRepository repository;

  GetBoards(this.repository);

  Future<List<Boards>> call() {
    return repository.getBoardss();
  }
}