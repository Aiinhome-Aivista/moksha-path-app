import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc
    extends Bloc<SettingEvent, SettingState> {

  SettingBloc() : super(SettingInitial()) {
    on<SettingStarted>(_onStarted);
  }

  Future<void> _onStarted(
    SettingStarted event,
    Emitter<SettingState> emit,
  ) async {
    // TODO: implement event handler
  }
}
