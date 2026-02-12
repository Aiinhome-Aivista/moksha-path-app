part of 'register_bloc.dart';

@immutable
sealed class RegisterEvent {}

final class RegisterStarted
    extends RegisterEvent {

  final String username;
  final String password;

  RegisterStarted({
    required this.username,
    required this.password,
  });
}

final class RegisterCompleted
    extends RegisterEvent {}