part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}
// sealed class AuthState extends Equatable{
//   const AuthState();

//   @override
//   List<Object?> get props => [];
// }

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {}

final class AcademicBoardsLoadInProgress extends AuthState {}

//success state
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

// This is for the Roles success

final class RolesLoadInProgress extends AuthState {}

final class RolesLoadSuccess extends AuthState {
  final List<Role> roles;

  RolesLoadSuccess(this.roles);
}

final class RolesLoadFailure extends AuthState {
  final String error;

  RolesLoadFailure(this.error);

  @override
  String toString() => 'RolesLoadFailure: $error';
}
