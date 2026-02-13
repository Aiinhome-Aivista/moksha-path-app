import '../entities/username_check.dart';

abstract class UsernameCheckRepository {
  Future<UsernameCheck> checkUsername(String username);
}
