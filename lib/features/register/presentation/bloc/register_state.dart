part of 'register_bloc.dart';

@immutable
sealed class RegisterState {}

final class RegisterInitial extends RegisterState {}

final class RegisterLoading extends RegisterState {}

final class RegisterSuccess extends RegisterState {}

final class RegisterFailure extends RegisterState {}

// Username Suggestions States
final class UsernameSuggestionsLoadInProgress extends RegisterState {}

final class UsernameSuggestionsLoadSuccess extends RegisterState {
  final List<String> suggestions;

  UsernameSuggestionsLoadSuccess(this.suggestions);
}

final class UsernameSuggestionsLoadFailure extends RegisterState {
  final String error;

  UsernameSuggestionsLoadFailure(this.error);

  @override
  String toString() => 'UsernameSuggestionsLoadFailure: $error';
}

// Username Check States
final class UsernameCheckLoadInProgress extends RegisterState {}

final class UsernameCheckLoadSuccess extends RegisterState {
  final bool available;
  final String message;

  UsernameCheckLoadSuccess(this.available, {this.message = ''});
}

final class UsernameCheckLoadFailure extends RegisterState {
  final String error;

  UsernameCheckLoadFailure(this.error);

  @override
  String toString() => 'UsernameCheckLoadFailure: $error';
}

// Send OTP States
final class SendOtpLoadInProgress extends RegisterState {}

final class SendOtpLoadSuccess extends RegisterState {
  final String message;

  SendOtpLoadSuccess(this.message);
}

final class SendOtpLoadFailure extends RegisterState {
  final String error;

  SendOtpLoadFailure(this.error);

  @override
  String toString() => 'SendOtpLoadFailure: $error';
}

// Verify OTP States
final class VerifyOtpLoadInProgress extends RegisterState {}

final class VerifyOtpLoadSuccess extends RegisterState {
  final String message;

  VerifyOtpLoadSuccess(this.message);
}

final class VerifyOtpLoadFailure extends RegisterState {
  final String error;

  VerifyOtpLoadFailure(this.error);

  @override
  String toString() => 'VerifyOtpLoadFailure: $error';
}

// Boards States
final class BoardsLoadInProgress extends RegisterState {}

final class BoardsLoadSuccess extends RegisterState {
  final List<AcademicItem> boards;
  BoardsLoadSuccess(this.boards);
}

final class BoardsLoadFailure extends RegisterState {
  final String error;
  BoardsLoadFailure(this.error);
}

// Schools States
final class SchoolsLoadInProgress extends RegisterState {}

final class SchoolsLoadSuccess extends RegisterState {
  final List<AcademicItem> schools;
  SchoolsLoadSuccess(this.schools);
}

final class SchoolsLoadFailure extends RegisterState {
  final String error;
  SchoolsLoadFailure(this.error);
}

// Classes States
final class ClassesLoadInProgress extends RegisterState {}

final class ClassesLoadSuccess extends RegisterState {
  final List<AcademicItem> classes;
  ClassesLoadSuccess(this.classes);
}

final class ClassesLoadFailure extends RegisterState {
  final String error;
  ClassesLoadFailure(this.error);
}

// Years States
final class YearsLoadInProgress extends RegisterState {}

final class YearsLoadSuccess extends RegisterState {
  final List<AcademicYear> years;
  YearsLoadSuccess(this.years);
}

final class YearsLoadFailure extends RegisterState {
  final String error;
  YearsLoadFailure(this.error);
}
