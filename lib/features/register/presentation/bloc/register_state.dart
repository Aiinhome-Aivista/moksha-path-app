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
