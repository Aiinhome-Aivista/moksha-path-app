part of 'auth_bloc.dart';

final class LoginOtpSendRequested extends AuthEvent {
  final String username;
  final String? email;
  final String? phone;

  LoginOtpSendRequested({required this.username, this.email, this.phone});
}

final class LoginOtpVerifyRequested extends AuthEvent {
  final String username;
  final String otp;
  final String? email;
  final String? phone;

  LoginOtpVerifyRequested({
    required this.username,
    required this.otp,
    this.email,
    this.phone,
  });
}

final class LoginRegistrationRequested extends AuthEvent {
  final int roleId;
  final String username;
  final String fullName;
  final String email;
  final String mobile;

  LoginRegistrationRequested({
    required this.roleId,
    required this.username,
    required this.fullName,
    required this.email,
    required this.mobile,
  });
}
