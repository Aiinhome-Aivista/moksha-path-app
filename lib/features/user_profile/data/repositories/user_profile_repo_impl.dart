import '../../domain/entities/user_profile.dart';
import '../../domain/repositories/user_profile_repository.dart';
import '../datasources/user_profile_remote_data_source.dart';
import '../models/user_profile_model.dart';

class UserProfileRepoImpl implements UserProfileRepository {
  final UserProfileRemoteDataSource remote;

  UserProfileRepoImpl(this.remote);

  @override
  Future<List<UserProfile>> getUserProfiles() async {

    try {

       final data = await remote.fetchUserProfiles();
    return data.map((e) => UserProfileModel.fromJson(e as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw e.toString();
    }
   
  }
}