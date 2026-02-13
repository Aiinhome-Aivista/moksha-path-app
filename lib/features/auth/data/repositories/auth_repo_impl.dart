import '../../domain/entities/login_user.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepoImpl(this.remote);

  @override
  Future<LoginUser> register({
    required int roleId,
    required String username,
    required String fullName,
    required String email,
    required String mobile,
  }) async {
    try {
      return await remote.register(
        roleId: roleId,
        username: username,
        fullName: fullName,
        email: email,
        mobile: mobile,
      );
    } catch (e) {
      throw e.toString();
    }
  }
}
