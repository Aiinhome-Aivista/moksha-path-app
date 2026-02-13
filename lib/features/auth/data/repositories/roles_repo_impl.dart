import 'package:moksha_path/features/auth/data/datasources/roles_remote_data_source.dart';
import 'package:moksha_path/features/auth/domain/entities/roles.dart';
import 'package:moksha_path/features/auth/domain/repositories/roles_repository.dart';

class RolesRepositoryImpl implements RolesRepository {
  final RolesRemoteDataSource remote;
  RolesRepositoryImpl(this.remote);

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
