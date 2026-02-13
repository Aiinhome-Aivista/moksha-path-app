import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'boards_event.dart';
part 'boards_state.dart';

class BoardsBloc
    extends Bloc<BoardsEvent, BoardsState> {

  BoardsBloc() : super(BoardsInitial()) {
    on<BoardsStarted>(_onStarted);
  }

  Future<void> _onStarted(
    BoardsStarted event,
    Emitter<BoardsState> emit,
  ) async {
    // TODO: implement event handler
  }
}
