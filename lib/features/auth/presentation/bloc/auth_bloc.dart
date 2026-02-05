import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc
    extends Bloc<AuthEvent, AuthState> {

  AuthBloc() : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
  }

  Future<void> _onStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
    // TODO: implement event handler
  }
}
