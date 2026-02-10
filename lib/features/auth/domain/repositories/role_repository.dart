import 'package:moksha_path/features/auth/domain/entities/role.dart';

abstract class RoleRepository {
  Future<List<Role>> getRoles();
}
