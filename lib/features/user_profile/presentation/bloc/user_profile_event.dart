part of 'user_profile_bloc.dart';

@immutable
sealed class UserProfileEvent {}

final class UserProfileStarted
    extends UserProfileEvent {

  final String username;
  final String password;

  UserProfileStarted({
    required this.username,
    required this.password,
  });
}

final class UserProfileCompleted
    extends UserProfileEvent {}