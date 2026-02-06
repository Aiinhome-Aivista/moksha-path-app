import '../../domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({required super.id});

  factory AuthModel.fromJson(Map<String, dynamic> json) {
    return AuthModel(
      id: json['id'],
    );
  }
}

