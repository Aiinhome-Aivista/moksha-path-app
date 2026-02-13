import '../../domain/entities/login_user.dart';

class LoginUserModel extends LoginUser {
  const LoginUserModel({
    required super.token,
    required super.refreshToken,
    required super.userId,
    required super.name,
    required super.username,
  });

  factory LoginUserModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? {};
    final user = data['user'] ?? {};
    return LoginUserModel(
      token: data['token'] ?? '',
      refreshToken: data['refresh_token'] ?? '',
      userId: user['sub'] ?? '',
      name: user['name'] ?? '',
      username: user['username'] ?? '',
    );
  }
}
