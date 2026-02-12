import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc
    extends Bloc<RegisterEvent, RegisterState> {

  RegisterBloc() : super(RegisterInitial()) {
    on<RegisterStarted>(_onStarted);
  }

  Future<void> _onStarted(
    RegisterStarted event,
    Emitter<RegisterState> emit,
  ) async {
    // TODO: implement event handler
  }
}
