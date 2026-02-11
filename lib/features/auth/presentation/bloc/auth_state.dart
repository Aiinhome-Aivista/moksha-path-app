part of 'auth_bloc.dart';


@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}
final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {}

final class AcademicBoardsLoadInProgress extends AuthState {}
final class AcademicBoardsLoadSuccess extends AuthState {
  final List<AcademicBoard> academicBoards;

  AcademicBoardsLoadSuccess(this.academicBoards);
}
final class AcademicBoardsLoadFailure extends AuthState {
  final String error;

  AcademicBoardsLoadFailure(this.error);

  @override
  String toString() => 'AcademicBoardsLoadFailure: $error';
}

final class RolesLoadInProgress extends AuthState {}
final class RolesLoadSuccess extends AuthState {
  final List<Role> roles;
  final int? selectedRoleId;

  RolesLoadSuccess(this.roles, {this.selectedRoleId});
}
final class RolesLoadFailure extends AuthState {
  final String error;

  RolesLoadFailure(this.error);

  @override
  String toString() => 'RolesLoadFailure: $error';
}