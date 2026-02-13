import 'package:moksha_path/core/helper/string_modifier.dart';
import 'package:moksha_path/features/auth/domain/entities/roles.dart';

// This is where we are creating the model of the entity of the domain.
class RoleModel extends Role {
  const RoleModel({required super.roleId, required super.roleName});

  // Json mapping here.
  factory RoleModel.fromJson(Map<String, dynamic> json) {
    return RoleModel(
      roleId: json['role_id'],

      // here we've used helper to modify whenever Required
      roleName: joinTheString(json['role_name']),
    );
  }
}
