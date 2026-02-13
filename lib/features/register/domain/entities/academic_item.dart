import 'package:equatable/equatable.dart';

class AcademicItem extends Equatable {
  final int id;
  final String name;

  const AcademicItem({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
