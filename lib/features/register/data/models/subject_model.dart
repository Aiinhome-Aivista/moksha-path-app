import '../../domain/entities/subject.dart';

class SubjectModel extends Subject {
  const SubjectModel({required super.subjectId, required super.subjectName});

  factory SubjectModel.fromJson(Map<String, dynamic> json) {
    return SubjectModel(
      subjectId: json['subject_id'] ?? 0,
      subjectName: json['subject_name'] ?? '',
    );
  }

  static List<SubjectModel> fromJsonList(List<dynamic> list) {
    return list.map((e) => SubjectModel.fromJson(e)).toList();
  }
}
