import 'package:equatable/equatable.dart';

class LearningPlan extends Equatable {
  final int id;

  const LearningPlan({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
