import '../../domain/entities/subject_tests.dart';
import '../../domain/repositories/subject_tests_repository.dart';
import '../datasources/subject_tests_remote_data_source.dart';
import '../models/subject_tests_model.dart';

class SubjectTestsRepoImpl implements SubjectTestsRepository {
  final SubjectTestsRemoteDataSource remote;

  SubjectTestsRepoImpl(this.remote);

  @override
  Future<List<SubjectTests>> getSubjectTestss() async {

    try {

       final data = await remote.fetchSubjectTestss();
    return data.map((e) => SubjectTestsModel.fromJson(e as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw e.toString();
    }
   
  }
}