import '../../domain/entities/subject.dart';
import '../../domain/repositories/subject_repository.dart';
import '../datasources/subject_remote_data_source.dart';

class SubjectRepoImpl implements SubjectRepository {
  final SubjectRemoteDataSource remote;

  SubjectRepoImpl(this.remote);

  @override
  Future<List<Subject>> getSubjects({
    required int boardId,
    required int schoolId,
    required int classId,
    required String academicYear,
  }) async {
    try {
      return await remote.fetchSubjects(
        boardId: boardId,
        schoolId: schoolId,
        classId: classId,
        academicYear: academicYear,
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
