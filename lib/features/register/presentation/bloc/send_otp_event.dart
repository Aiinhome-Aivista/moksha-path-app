part of 'register_bloc.dart';

final class SendOtpRequested extends RegisterEvent {
  final String username;
  final String? email;
  final String? phone;

  SendOtpRequested({required this.username, this.email, this.phone});
}
