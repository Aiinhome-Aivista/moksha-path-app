part of 'auth_bloc.dart';

final class RolesFetched extends AuthEvent {}

final class RoleSelected extends AuthEvent {
  final int roleId;

  RoleSelected(this.roleId);
}
