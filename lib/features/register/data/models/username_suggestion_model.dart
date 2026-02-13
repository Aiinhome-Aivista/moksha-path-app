import '../../domain/entities/username_suggestion.dart';

class UsernameSuggestionModel extends UsernameSuggestion {
  const UsernameSuggestionModel({required super.suggestions});

  factory UsernameSuggestionModel.fromJson(Map<String, dynamic> json) {
    final data = json['data'] ?? json;
    final List<dynamic> raw = data['suggestions'] ?? [];
    return UsernameSuggestionModel(
      suggestions: raw.map((e) => e.toString()).toList(),
    );
  }
}
