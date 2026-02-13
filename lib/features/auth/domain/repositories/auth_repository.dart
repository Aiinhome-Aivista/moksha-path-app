import '../entities/login_user.dart';

abstract class AuthRepository {
  Future<LoginUser> register({
    required int roleId,
    required String username,
    required String fullName,
    required String email,
    required String mobile,
  });
}
