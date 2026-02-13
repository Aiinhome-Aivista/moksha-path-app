part of 'register_bloc.dart';

final class UsernameSuggestionsFetched extends RegisterEvent {
  final String name;

  UsernameSuggestionsFetched(this.name);
}
