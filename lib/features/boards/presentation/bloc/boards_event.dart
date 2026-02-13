part of 'boards_bloc.dart';

@immutable
sealed class BoardsEvent {}

final class BoardsStarted
    extends BoardsEvent {

  final String username;
  final String password;

  BoardsStarted({
    required this.username,
    required this.password,
  });
}

final class BoardsCompleted
    extends BoardsEvent {}