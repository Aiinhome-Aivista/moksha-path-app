import '../../domain/entities/academic_year.dart';

class AcademicYearModel extends AcademicYear {
  const AcademicYearModel({required super.year});

  factory AcademicYearModel.fromJson(Map<String, dynamic> json) {
    return AcademicYearModel(year: json['year'] ?? '');
  }

  static List<AcademicYearModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => AcademicYearModel.fromJson(e)).toList();
  }
}
