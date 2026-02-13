part of 'boards_bloc.dart';


@immutable
sealed class BoardsState {}

final class BoardsInitial extends BoardsState {}

final class BoardsLoading extends BoardsState {}
final class BoardsSuccess extends BoardsState {}

final class BoardsFailure extends BoardsState {}