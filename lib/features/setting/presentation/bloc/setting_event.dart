part of 'setting_bloc.dart';

@immutable
sealed class SettingEvent {}

final class SettingStarted
    extends SettingEvent {

  final String username;
  final String password;

  SettingStarted({
    required this.username,
    required this.password,
  });
}

final class SettingCompleted
    extends SettingEvent {}