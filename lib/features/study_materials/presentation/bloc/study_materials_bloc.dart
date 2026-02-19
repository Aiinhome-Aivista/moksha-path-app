import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'study_materials_event.dart';
part 'study_materials_state.dart';

class StudyMaterialsBloc
    extends Bloc<StudyMaterialsEvent, StudyMaterialsState> {

  StudyMaterialsBloc() : super(StudyMaterialsInitial()) {
    on<StudyMaterialsStarted>(_onStarted);
  }

  Future<void> _onStarted(
    StudyMaterialsStarted event,
    Emitter<StudyMaterialsState> emit,
  ) async {
    // TODO: implement event handler
  }
}
