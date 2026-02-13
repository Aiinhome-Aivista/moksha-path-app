import '../../domain/entities/username_check.dart';
import '../../domain/repositories/username_check_repository.dart';
import '../datasources/username_check_remote_data_source.dart';

class UsernameCheckRepoImpl implements UsernameCheckRepository {
  final UsernameCheckRemoteDataSource remote;

  UsernameCheckRepoImpl(this.remote);

  @override
  Future<UsernameCheck> checkUsername(String username) async {
    try {
      final data = await remote.checkUsername(username);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
