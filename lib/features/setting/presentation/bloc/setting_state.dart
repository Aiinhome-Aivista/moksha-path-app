part of 'setting_bloc.dart';

@immutable
sealed class SettingState {}

final class SettingInitial extends SettingState {}

final class SettingLoading extends SettingState {}

final class SettingSuccess extends SettingState {
  final List<Setting> boards;
  SettingSuccess(this.boards);
}

final class SettingFailure extends SettingState {
  final String error;
  SettingFailure(this.error);
}
