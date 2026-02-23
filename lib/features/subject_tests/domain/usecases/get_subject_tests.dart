import '../entities/subject_tests.dart';
import '../repositories/subject_tests_repository.dart';

class GetSubjectTests {
  final SubjectTestsRepository repository;

  GetSubjectTests(this.repository);

  Future<List<SubjectTests>> call() {
    return repository.getSubjectTestss();
  }
}