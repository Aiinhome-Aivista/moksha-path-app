import 'package:equatable/equatable.dart';

class Boards extends Equatable {
  final int id;

  const Boards({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
