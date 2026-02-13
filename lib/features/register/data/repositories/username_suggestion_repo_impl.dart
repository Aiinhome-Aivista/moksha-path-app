import '../../domain/entities/username_suggestion.dart';
import '../../domain/repositories/username_suggestion_repository.dart';
import '../datasources/username_suggestion_remote_data_source.dart';

class UsernameSuggestionRepoImpl implements UsernameSuggestionRepository {
  final UsernameSuggestionRemoteDataSource remote;

  UsernameSuggestionRepoImpl(this.remote);

  @override
  Future<UsernameSuggestion> getSuggestions(String name) async {
    try {
      final data = await remote.fetchSuggestions(name);
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
