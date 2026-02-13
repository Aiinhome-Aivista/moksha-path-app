import '../../domain/entities/username_check.dart';

class UsernameCheckModel extends UsernameCheck {
  const UsernameCheckModel({required super.available});

  factory UsernameCheckModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    return UsernameCheckModel(available: data['available'] ?? false);
  }
}
