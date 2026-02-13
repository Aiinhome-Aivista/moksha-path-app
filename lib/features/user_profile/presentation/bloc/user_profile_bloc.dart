import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_profile_event.dart';
part 'user_profile_state.dart';

class UserProfileBloc
    extends Bloc<UserProfileEvent, UserProfileState> {

  UserProfileBloc() : super(UserProfileInitial()) {
    on<UserProfileStarted>(_onStarted);
  }

  Future<void> _onStarted(
    UserProfileStarted event,
    Emitter<UserProfileState> emit,
  ) async {
    // TODO: implement event handler
  }
}
