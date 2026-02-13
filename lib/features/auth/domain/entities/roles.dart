import 'package:equatable/equatable.dart';

// This is where we design our blueprint/entity of the the model

class Role extends Equatable {
  final int? roleId;
  final String? roleName;

  const Role({this.roleId, this.roleName});

  @override
  List<Object?> get props => [roleId, roleName];
}
