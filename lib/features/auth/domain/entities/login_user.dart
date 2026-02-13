import 'package:equatable/equatable.dart';

class LoginUser extends Equatable {
  final String token;
  final String refreshToken;
  final String userId;
  final String name;
  final String username;

  const LoginUser({
    required this.token,
    required this.refreshToken,
    required this.userId,
    required this.name,
    required this.username,
  });

  @override
  List<Object?> get props => [token, refreshToken, userId, name, username];
}
