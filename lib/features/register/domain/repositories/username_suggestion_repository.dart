import '../entities/username_suggestion.dart';

abstract class UsernameSuggestionRepository {
  Future<UsernameSuggestion> getSuggestions(String name);
}
