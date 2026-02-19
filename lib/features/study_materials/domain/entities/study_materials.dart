import 'package:equatable/equatable.dart';

class StudyMaterials extends Equatable {
  final int id;

  const StudyMaterials({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
