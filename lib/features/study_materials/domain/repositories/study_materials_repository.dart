import '../entities/study_materials.dart';

abstract class StudyMaterialsRepository {
  Future<List<StudyMaterials>> getStudyMaterialss();
}