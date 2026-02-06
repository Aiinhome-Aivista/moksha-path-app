import '../../domain/entities/auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepoImpl(this.remote);

  @override
  Future<List<Auth>> getAuths() async {
    try {
      final data = await remote.fetchAuths();
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
