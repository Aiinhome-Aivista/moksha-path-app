import '../../domain/entities/subject_tests.dart';

class SubjectTestsModel extends SubjectTests {
  const SubjectTestsModel({required super.id});

  factory SubjectTestsModel.fromJson(Map<String, dynamic> json) {
    return SubjectTestsModel(
      id: json['id'],
    );
  }
}