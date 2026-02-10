part of 'role_bloc.dart';

abstract class RoleState extends Equatable {
  const RoleState();

  @override
  List<Object> get props => [];
}

class RoleInitial extends RoleState {}

class RolesLoadInProgress extends RoleState {}

class RolesLoadSuccess extends RoleState {
  final List<Role> roles;
  final int? selectedRoleId;

  const RolesLoadSuccess(this.roles, {this.selectedRoleId});

  @override
  List<Object> get props => [roles, selectedRoleId ?? 0];
}

class RolesLoadFailure extends RoleState {
  final String error;

  const RolesLoadFailure(this.error);

  @override
  List<Object> get props => [error];
}
