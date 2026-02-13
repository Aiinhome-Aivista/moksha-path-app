part of 'register_bloc.dart';

final class UsernameChecked extends RegisterEvent {
  final String username;

  UsernameChecked(this.username);
}
