import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/features/auth/domain/entities/academicBoard.dart';
import 'package:moksha_path/features/auth/domain/repositories/academic_board_repository.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc
    extends Bloc<AuthEvent, AuthState> {

      final AcademicBoardRepository academicBoardRepository;

  AuthBloc(this.academicBoardRepository) : super(AuthInitial()) {
    on<AuthStarted>(_onStarted);
    on<AcademicMastersFetched>(_fetchAcademicBoards) ;
  }

  

  Future<void> _onStarted(
    AuthStarted event,
    Emitter<AuthState> emit,
  ) async {
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

  void _fetchAcademicBoards(AcademicMastersFetched event, Emitter<AuthState> emit) async{
    emit(AcademicBoardsLoadInProgress());

    try {

      final List<AcademicBoard> academicBoards = await academicBoardRepository.getAcademicBoards();
      emit(AcademicBoardsLoadSuccess(academicBoards));
      
    } catch (e) {
      emit(AcademicBoardsLoadFailure(e.toString()));
      
    }


  }
}
