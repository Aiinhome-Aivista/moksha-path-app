import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/features/auth/domain/entities/academicBoard.dart';
import 'package:moksha_path/features/auth/domain/entities/role.dart';
import 'package:moksha_path/features/auth/domain/repositories/academic_board_repository.dart';
import 'package:moksha_path/features/auth/domain/repositories/role_repository.dart';

part 'auth_event.dart';
part 'role_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AcademicBoardRepository academicBoardRepository;
  final RoleRepository roleRepository;

  AuthBloc(this.academicBoardRepository, this.roleRepository)
    : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    // on<AcademicMastersFetched>(_fetchAcademicBoards);
    on<RolesFetched>(_fetchRoles);
    on<RoleSelected>(_onRoleSelected);
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

  void _fetchAcademicBoards(
    AcademicMastersFetched event,
    Emitter<AuthState> emit,
  ) async {
    emit(AcademicBoardsLoadInProgress());

    try {
      final List<AcademicBoard> academicBoards = await academicBoardRepository
          .getAcademicBoards();
      emit(AcademicBoardsLoadSuccess(academicBoards));
    } catch (e) {
      emit(AcademicBoardsLoadFailure(e.toString()));
    }
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
}
