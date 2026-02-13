import '../../domain/entities/academic_item.dart';
import '../../domain/entities/academic_year.dart';
import '../../domain/repositories/academic_master_repository.dart';
import '../datasources/academic_master_remote_data_source.dart';

class AcademicMasterRepoImpl implements AcademicMasterRepository {
  final AcademicMasterRemoteDataSource remote;

  AcademicMasterRepoImpl(this.remote);

  @override
  Future<List<AcademicItem>> getBoards() async {
    try {
      return await remote.fetchBoards();
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<AcademicItem>> getSchools({required int boardId}) async {
    try {
      return await remote.fetchSchools(boardId: boardId);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<AcademicItem>> getClasses({
    required int boardId,
    required int schoolId,
  }) async {
    try {
      return await remote.fetchClasses(boardId: boardId, schoolId: schoolId);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<List<AcademicYear>> getYears({
    required int boardId,
    required int schoolId,
    required int classId,
  }) async {
    try {
      return await remote.fetchYears(
        boardId: boardId,
        schoolId: schoolId,
        classId: classId,
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
