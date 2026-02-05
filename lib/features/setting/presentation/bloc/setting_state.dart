part of 'setting_bloc.dart';


@immutable
sealed class SettingState {}

final class SettingInitial extends SettingState {}

final class SettingLoading extends SettingState {}
final class SettingSuccess extends SettingState {}

final class SettingFailure extends SettingState {}