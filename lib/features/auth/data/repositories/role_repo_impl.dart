import 'package:moksha_path/features/auth/data/datasources/role_remote_data_source.dart';
import 'package:moksha_path/features/auth/domain/entities/role.dart';
import 'package:moksha_path/features/auth/domain/repositories/role_repository.dart';

class RoleRepoImpl implements RoleRepository {
  final RoleRemoteDataSource remote;

  RoleRepoImpl(this.remote);

  @override
  Future<List<Role>> getRoles() async {
    try {
      final data = await remote.fetchRoles();
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
