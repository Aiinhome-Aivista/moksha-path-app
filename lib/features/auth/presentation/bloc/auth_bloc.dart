import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:moksha_path/features/auth/domain/entities/login_user.dart';
import 'package:moksha_path/features/auth/domain/entities/role.dart';
import 'package:moksha_path/features/auth/domain/repositories/auth_repository.dart';
import 'package:moksha_path/features/auth/domain/repositories/role_repository.dart';
import 'package:moksha_path/features/register/domain/entities/otp_response.dart';
import 'package:moksha_path/features/register/domain/repositories/otp_repository.dart';

part 'auth_event.dart';
part 'role_event.dart';
part 'login_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final RoleRepository roleRepository;
  final OtpRepository otpRepository;
  final AuthRepository authRepository;

  AuthBloc(this.roleRepository, this.otpRepository, this.authRepository)
    : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<RolesFetched>(_fetchRoles);
    on<RoleSelected>(_onRoleSelected);
    on<LoginOtpSendRequested>(_onLoginOtpSend);
    on<LoginOtpVerifyRequested>(_onLoginOtpVerify);
    on<LoginRegistrationRequested>(_onLoginRegistration);
  }

  Future<void> _onStarted(AuthStarted event, Emitter<AuthState> emit) async {
    // TODO: implement event handler
  }

  @override
  void onChange(Change<AuthState> change) {
    super.onChange(change);
    debugPrint("AuthBloc state changed: $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrintStack(stackTrace: stackTrace, label: "AuthBloc error: $error");
  }

  Future<void> _fetchRoles(RolesFetched event, Emitter<AuthState> emit) async {
    emit(RolesLoadInProgress());
    try {
      final List<Role> roles = await roleRepository.getRoles();
      emit(RolesLoadSuccess(roles));
    } catch (e) {
      emit(RolesLoadFailure(e.toString()));
    }
  }

  void _onRoleSelected(RoleSelected event, Emitter<AuthState> emit) {
    final currentState = state;
    if (currentState is RolesLoadSuccess) {
      emit(RolesLoadSuccess(currentState.roles, selectedRoleId: event.roleId));
    }
  }

  Future<void> _onLoginOtpSend(
    LoginOtpSendRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginOtpSendInProgress());
    try {
      final OtpResponse result = await otpRepository.sendOtp(
        username: event.username,
        email: event.email,
        phone: event.phone,
      );
      emit(LoginOtpSendSuccess(result.message));
    } catch (e) {
      emit(LoginOtpSendFailure(e.toString()));
    }
  }

  Future<void> _onLoginOtpVerify(
    LoginOtpVerifyRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginOtpVerifyInProgress());
    try {
      final OtpResponse result = await otpRepository.verifyOtp(
        username: event.username,
        otp: event.otp,
        email: event.email,
        phone: event.phone,
      );
      emit(LoginOtpVerifySuccess(result.message));
    } catch (e) {
      emit(LoginOtpVerifyFailure(e.toString()));
    }
  }

  Future<void> _onLoginRegistration(
    LoginRegistrationRequested event,
    Emitter<AuthState> emit,
  ) async {
    emit(LoginRegistrationInProgress());
    try {
      final LoginUser user = await authRepository.register(
        roleId: event.roleId,
        username: event.username,
        fullName: event.fullName,
        email: event.email,
        mobile: event.mobile,
      );
      emit(LoginRegistrationSuccess(user));
    } catch (e) {
      emit(LoginRegistrationFailure(e.toString()));
    }
  }
}
