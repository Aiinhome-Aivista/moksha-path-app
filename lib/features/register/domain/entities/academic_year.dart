import 'package:equatable/equatable.dart';

class AcademicYear extends Equatable {
  final String year;

  const AcademicYear({required this.year});

  @override
  List<Object?> get props => [year];
}
