import 'package:equatable/equatable.dart';

class UsernameSuggestion extends Equatable {
  final List<String> suggestions;

  const UsernameSuggestion({this.suggestions = const []});

  @override
  List<Object?> get props => [suggestions];
}
