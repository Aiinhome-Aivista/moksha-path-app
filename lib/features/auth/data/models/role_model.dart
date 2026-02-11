import 'package:moksha_path/features/auth/domain/entities/role.dart';

class RoleModel extends Role {
  const RoleModel({
    required super.roleId,
    required super.roleName,
  });

  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      roleId: json['role_id'],
      roleName: json['role_name'],
    );
  }
}
