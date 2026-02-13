import '../../domain/entities/academic_item.dart';

class AcademicItemModel extends AcademicItem {
  const AcademicItemModel({required super.id, required super.name});

  factory AcademicItemModel.fromJson(Map<String, dynamic> json) {
    return AcademicItemModel(id: json['id'] ?? 0, name: json['name'] ?? '');
  }

  static List<AcademicItemModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => AcademicItemModel.fromJson(e)).toList();
  }
}
