import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_event.dart';
part 'dashboard_state.dart';

class DashboardBloc
    extends Bloc<DashboardEvent, DashboardState> {

  DashboardBloc() : super(DashboardInitial()) {
    on<DashboardStarted>(_onStarted);
  }

  Future<void> _onStarted(
    DashboardStarted event,
    Emitter<DashboardState> emit,
  ) async {
    // TODO: implement event handler
  }
}
