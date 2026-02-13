import '../entities/academic_item.dart';
import '../entities/academic_year.dart';

abstract class AcademicMasterRepository {
  Future<List<AcademicItem>> getBoards();
  Future<List<AcademicItem>> getSchools({required int boardId});
  Future<List<AcademicItem>> getClasses({
    required int boardId,
    required int schoolId,
  });
  Future<List<AcademicYear>> getYears({
    required int boardId,
    required int schoolId,
    required int classId,
  });
}
