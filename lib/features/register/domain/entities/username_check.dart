import 'package:equatable/equatable.dart';

class UsernameCheck extends Equatable {
  final bool available;

  const UsernameCheck({this.available = false});

  @override
  List<Object?> get props => [available];
}
