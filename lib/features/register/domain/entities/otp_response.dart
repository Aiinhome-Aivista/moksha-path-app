import 'package:equatable/equatable.dart';

class OtpResponse extends Equatable {
  final String message;

  const OtpResponse({this.message = ''});

  @override
  List<Object?> get props => [message];
}
