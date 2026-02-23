import '../entities/subject_tests.dart';

abstract class SubjectTestsRepository {
  Future<List<SubjectTests>> getSubjectTestss();
}