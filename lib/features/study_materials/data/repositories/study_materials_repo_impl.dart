import '../../domain/entities/study_materials.dart';
import '../../domain/repositories/study_materials_repository.dart';
import '../datasources/study_materials_remote_data_source.dart';
import '../models/study_materials_model.dart';

class StudyMaterialsRepoImpl implements StudyMaterialsRepository {
  final StudyMaterialsRemoteDataSource remote;

  StudyMaterialsRepoImpl(this.remote);

  @override
  Future<List<StudyMaterials>> getStudyMaterialss() async {

    try {

       final data = await remote.fetchStudyMaterialss();
    return data.map((e) => StudyMaterialsModel.fromJson(e as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw e.toString();
    }
   
  }
}