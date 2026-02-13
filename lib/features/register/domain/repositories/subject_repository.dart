import '../entities/subject.dart';

abstract class SubjectRepository {
  Future<List<Subject>> getSubjects({
    required int boardId,
    required int schoolId,
    required int classId,
    required String academicYear,
  });
}
