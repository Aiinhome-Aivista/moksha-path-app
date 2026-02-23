import 'package:equatable/equatable.dart';

class SubjectTests extends Equatable {
  final int id;

  const SubjectTests({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
