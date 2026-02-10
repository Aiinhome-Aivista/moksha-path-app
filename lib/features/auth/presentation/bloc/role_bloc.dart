import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/features/auth/domain/entities/role.dart';
import 'package:moksha_path/features/auth/domain/repositories/role_repository.dart';

part 'role_event.dart';
part 'role_state.dart';

class RoleBloc extends Bloc<RoleEvent, RoleState> {
  final RoleRepository roleRepository;

  RoleBloc(this.roleRepository) : super(RoleInitial()) {
    on<RolesFetched>(_fetchRoles);
    on<RoleSelected>(_onRoleSelected);
  }

  Future<void> _fetchRoles(RolesFetched event, Emitter<RoleState> emit) async {
    emit(RolesLoadInProgress());

    try {
      final List<Role> roles = await roleRepository.getRoles();
      emit(RolesLoadSuccess(roles));
    } catch (e) {
      emit(RolesLoadFailure(e.toString()));
    }
  }

  void _onRoleSelected(RoleSelected event, Emitter<RoleState> emit) {
    if (state is RolesLoadSuccess) {
      final currentState = state as RolesLoadSuccess;
      emit(RolesLoadSuccess(currentState.roles, selectedRoleId: event.roleId));
    }
  }

  @override
  void onChange(Change<RoleState> change) {
    super.onChange(change);
    debugPrint("RoleBloc state changed: $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrintStack(stackTrace: stackTrace, label: "RoleBloc error: $error");
  }
}
