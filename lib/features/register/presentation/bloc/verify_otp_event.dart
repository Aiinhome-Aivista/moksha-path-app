part of 'register_bloc.dart';

final class VerifyOtpRequested extends RegisterEvent {
  final String username;
  final String otp;
  final String? email;
  final String? phone;

  VerifyOtpRequested({
    required this.username,
    required this.otp,
    this.email,
    this.phone,
  });
}
