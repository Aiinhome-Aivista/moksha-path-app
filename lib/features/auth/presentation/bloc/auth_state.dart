part of 'auth_bloc.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {}

final class AuthFailure extends AuthState {}

// Roles
final class RolesLoadInProgress extends AuthState {}

final class RolesLoadSuccess extends AuthState {
  final List<Role> roles;
  final int? selectedRoleId;
  RolesLoadSuccess(this.roles, {this.selectedRoleId});
}

final class RolesLoadFailure extends AuthState {
  final String error;
  RolesLoadFailure(this.error);
  @override
  String toString() => 'RolesLoadFailure: $error';
}

// Login OTP Send
final class LoginOtpSendInProgress extends AuthState {}

final class LoginOtpSendSuccess extends AuthState {
  final String message;
  LoginOtpSendSuccess(this.message);
}

final class LoginOtpSendFailure extends AuthState {
  final String error;
  LoginOtpSendFailure(this.error);
}

// Login OTP Verify
final class LoginOtpVerifyInProgress extends AuthState {}

final class LoginOtpVerifySuccess extends AuthState {
  final String message;
  LoginOtpVerifySuccess(this.message);
}

final class LoginOtpVerifyFailure extends AuthState {
  final String error;
  LoginOtpVerifyFailure(this.error);
}

// Login Registration
final class LoginRegistrationInProgress extends AuthState {}

final class LoginRegistrationSuccess extends AuthState {
  final LoginUser user;
  LoginRegistrationSuccess(this.user);
}

final class LoginRegistrationFailure extends AuthState {
  final String error;
  LoginRegistrationFailure(this.error);
}
