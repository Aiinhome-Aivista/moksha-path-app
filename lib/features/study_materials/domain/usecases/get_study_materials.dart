import '../entities/study_materials.dart';
import '../repositories/study_materials_repository.dart';

class GetStudyMaterials {
  final StudyMaterialsRepository repository;

  GetStudyMaterials(this.repository);

  Future<List<StudyMaterials>> call() {
    return repository.getStudyMaterialss();
  }
}