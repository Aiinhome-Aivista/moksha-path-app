import 'package:moksha_path/features/auth/data/datasources/academic_board_remote_data_source.dart';
import 'package:moksha_path/features/auth/domain/entities/academicBoard.dart';
import 'package:moksha_path/features/auth/domain/repositories/academic_board_repository.dart';

class AcademicBoardRepoImpl implements AcademicBoardRepository {

  final AcademicBoardRemoteDataSource remote;

  AcademicBoardRepoImpl(this.remote);

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