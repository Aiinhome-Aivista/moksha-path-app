import 'package:moksha_path/features/auth/data/datasources/academic_board_remote_data_source.dart';
import 'package:moksha_path/features/auth/domain/entities/academicBoard.dart';
import 'package:moksha_path/features/auth/domain/repositories/academic_board_repository.dart';

// implements the repo from the domain layer
class AcademicBoardRepoImpl implements AcademicBoardRepository {

  final AcademicBoardRemoteDataSource remote;

  AcademicBoardRepoImpl(this.remote);

// here we're returning the data.
  @override
  Future<List<AcademicBoard>> getAcademicBoards() async {
    try {
      final data = await remote.fetchAcademicBoards();
      return data;
    } catch (e) {
      throw e.toString();
    }
  }


}