import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'learning_plan_event.dart';
part 'learning_plan_state.dart';

class LearningPlanBloc
    extends Bloc<LearningPlanEvent, LearningPlanState> {

  LearningPlanBloc() : super(LearningPlanInitial()) {
    on<LearningPlanStarted>(_onStarted);
  }

  Future<void> _onStarted(
    LearningPlanStarted event,
    Emitter<LearningPlanState> emit,
  ) async {
    // TODO: implement event handler
  }
}
