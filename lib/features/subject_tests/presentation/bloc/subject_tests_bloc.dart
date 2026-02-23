import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'subject_tests_event.dart';
part 'subject_tests_state.dart';

class SubjectTestsBloc
    extends Bloc<SubjectTestsEvent, SubjectTestsState> {

  SubjectTestsBloc() : super(SubjectTestsInitial()) {
    on<SubjectTestsStarted>(_onStarted);
  }

  Future<void> _onStarted(
    SubjectTestsStarted event,
    Emitter<SubjectTestsState> emit,
  ) async {
    // TODO: implement event handler
  }
}
