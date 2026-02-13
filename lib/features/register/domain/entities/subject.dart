import 'package:equatable/equatable.dart';

class Subject extends Equatable {
  final int subjectId;
  final String subjectName;

  const Subject({required this.subjectId, required this.subjectName});

  @override
  List<Object?> get props => [subjectId, subjectName];
}
