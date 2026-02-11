part of 'role_bloc.dart';

@immutable
sealed class RoleEvent {}

final class RolesFetched extends RoleEvent {}

final class RoleSelected extends RoleEvent {
  final int roleId;

  RoleSelected(this.roleId);
}
