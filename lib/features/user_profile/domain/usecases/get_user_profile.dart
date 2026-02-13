import '../entities/user_profile.dart';
import '../repositories/user_profile_repository.dart';

class GetUserProfile {
  final UserProfileRepository repository;

  GetUserProfile(this.repository);

  Future<List<UserProfile>> call() {
    return repository.getUserProfiles();
  }
}