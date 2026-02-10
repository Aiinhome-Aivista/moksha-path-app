part of 'role_bloc.dart';

abstract class RoleEvent extends Equatable {
  const RoleEvent();

  @override
  List<Object> get props => [];
}

class RolesFetched extends RoleEvent {}

class RoleSelected extends RoleEvent {
  final int roleId;

  const RoleSelected(this.roleId);

  @override
  List<Object> get props => [roleId];
}
