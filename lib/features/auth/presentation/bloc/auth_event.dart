part of 'auth_bloc.dart';

@immutable
sealed class AuthEvent {}

final class AuthStarted extends AuthEvent {
  final String username;
  final String password;

  AuthStarted({
    required this.username,
    required this.password,
  });
}

final class AuthCompleted extends AuthEvent {}

final class AcademicMastersFetched extends AuthEvent {}