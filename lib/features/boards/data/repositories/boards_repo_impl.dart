import '../../domain/entities/boards.dart';
import '../../domain/repositories/boards_repository.dart';
import '../datasources/boards_remote_data_source.dart';
import '../models/boards_model.dart';

class BoardsRepoImpl implements BoardsRepository {
  final BoardsRemoteDataSource remote;

  BoardsRepoImpl(this.remote);

  @override
  Future<List<Boards>> getBoardss() async {

    try {

       final data = await remote.fetchBoardss();
    return data.map((e) => BoardsModel.fromJson(e as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw e.toString();
    }
   
  }
}