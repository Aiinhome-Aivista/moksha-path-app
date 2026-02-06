import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final int id;

  const Auth({
    required this.id,
  });

  @override
  List<Object?> get props => [id];
}

