import 'package:equatable/equatable.dart';

class Setting extends Equatable {
  final int id;

  const Setting({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}
