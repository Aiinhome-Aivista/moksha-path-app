import '../../domain/entities/study_materials.dart';

class StudyMaterialsModel extends StudyMaterials {
  const StudyMaterialsModel({required super.id});

  factory StudyMaterialsModel.fromJson(Map<String, dynamic> json) {
    return StudyMaterialsModel(
      id: json['id'],
    );
  }
}