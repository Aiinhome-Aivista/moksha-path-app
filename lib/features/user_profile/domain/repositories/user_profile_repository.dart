import '../entities/user_profile.dart';

abstract class UserProfileRepository {
  Future<List<UserProfile>> getUserProfiles();
}