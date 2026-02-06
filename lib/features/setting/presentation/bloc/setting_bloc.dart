import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../domain/entities/setting.dart';
import '../../domain/usecases/get_setting.dart';

part 'setting_event.dart';
part 'setting_state.dart';

class SettingBloc extends Bloc<SettingEvent, SettingState> {
  final GetSetting getSetting;

  SettingBloc(this.getSetting) : super(SettingInitial()) {
    on<FetchAcademicMastersEvent>(_onFetchAcademicMasters);
  }

  Future<void> _onFetchAcademicMasters(
    FetchAcademicMastersEvent event,
    Emitter<SettingState> emit,
  ) async {
    emit(SettingLoading());

    try {
      final boards = await getSetting();
      emit(SettingSuccess(boards));
    } catch (e) {
      emit(SettingFailure(e.toString()));
    }
  }
}
