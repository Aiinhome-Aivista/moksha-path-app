part of 'role_bloc.dart';

@immutable
sealed class RoleState {}

final class RoleInitial extends RoleState {}

final class RolesLoadInProgress extends RoleState {}

final class RolesLoadSuccess extends RoleState {
  final List<Role> roles;
  final int? selectedRoleId;

  RolesLoadSuccess(this.roles, {this.selectedRoleId});
}

final class RolesLoadFailure extends RoleState {
  final String error;

  RolesLoadFailure(this.error);

  @override
  String toString() => 'RolesLoadFailure: $error';
}
