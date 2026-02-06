import 'package:equatable/equatable.dart';

class Setting extends Equatable {
  final int id;
  final String name;

  const Setting({required this.id, required this.name});

  @override
  List<Object?> get props => [id, name];
}
