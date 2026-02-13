import '../entities/login_user.dart';
import '../repositories/auth_repository.dart';

class GetAuth {
  final AuthRepository repository;

  GetAuth(this.repository);

  Future<LoginUser> call({
    required int roleId,
    required String username,
    required String fullName,
    required String email,
    required String mobile,
  }) {
    return repository.register(
      roleId: roleId,
      username: username,
      fullName: fullName,
      email: email,
      mobile: mobile,
    );
  }
}
