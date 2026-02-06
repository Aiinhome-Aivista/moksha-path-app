part of 'setting_bloc.dart';

@immutable
sealed class SettingEvent {}

final class FetchAcademicMastersEvent extends SettingEvent {}
