import 'package:equatable/equatable.dart';

class Role extends Equatable {
  final int roleId;
  final String roleName;

  const Role({
    this.roleId = 0,
    this.roleName = '',
  });

  @override
  List<Object?> get props => [roleId, roleName];
}
