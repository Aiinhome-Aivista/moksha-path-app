import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moksha_path/features/register/domain/entities/academic_item.dart';
import 'package:moksha_path/features/register/domain/entities/academic_year.dart';
import 'package:moksha_path/features/register/domain/repositories/username_suggestion_repository.dart';
import 'package:moksha_path/features/register/domain/repositories/username_check_repository.dart';
import 'package:moksha_path/features/register/domain/repositories/otp_repository.dart';
import 'package:moksha_path/features/register/domain/repositories/academic_master_repository.dart';

part 'register_event.dart';
part 'register_state.dart';
part 'username_suggestion_event.dart';
part 'username_check_event.dart';
part 'send_otp_event.dart';
part 'verify_otp_event.dart';
part 'boards_event.dart';
part 'schools_event.dart';
part 'classes_event.dart';
part 'years_event.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final UsernameSuggestionRepository usernameSuggestionRepository;
  final UsernameCheckRepository usernameCheckRepository;
  final OtpRepository otpRepository;
  final AcademicMasterRepository academicMasterRepository;

  RegisterBloc(
    this.usernameSuggestionRepository,
    this.usernameCheckRepository,
    this.otpRepository,
    this.academicMasterRepository,
  ) : super(RegisterInitial()) {
    on<RegisterStarted>(_onStarted);
    on<UsernameSuggestionsFetched>(_onUsernameSuggestionsFetched);
    on<UsernameChecked>(_onUsernameChecked);
    on<SendOtpRequested>(_onSendOtpRequested);
    on<VerifyOtpRequested>(_onVerifyOtpRequested);
    on<BoardsFetched>(_onBoardsFetched);
    on<SchoolsFetched>(_onSchoolsFetched);
    on<ClassesFetched>(_onClassesFetched);
    on<YearsFetched>(_onYearsFetched);
  }

  Future<void> _onStarted(
    RegisterStarted event,
    Emitter<RegisterState> emit,
  ) async {
    // TODO: implement event handler
  }

  @override
  void onChange(Change<RegisterState> change) {
    super.onChange(change);
    debugPrint("RegisterBloc state changed: $change");
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    debugPrintStack(
      stackTrace: stackTrace,
      label: "RegisterBloc error: $error",
    );
  }

  Future<void> _onUsernameSuggestionsFetched(
    UsernameSuggestionsFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(UsernameSuggestionsLoadInProgress());
    try {
      final result = await usernameSuggestionRepository.getSuggestions(
        event.name,
      );
      emit(UsernameSuggestionsLoadSuccess(result.suggestions));
    } catch (e) {
      emit(UsernameSuggestionsLoadFailure(e.toString()));
    }
  }

  Future<void> _onUsernameChecked(
    UsernameChecked event,
    Emitter<RegisterState> emit,
  ) async {
    emit(UsernameCheckLoadInProgress());
    try {
      final result = await usernameCheckRepository.checkUsername(
        event.username,
      );
      emit(UsernameCheckLoadSuccess(result.available));
    } catch (e) {
      emit(UsernameCheckLoadFailure(e.toString()));
    }
  }

  Future<void> _onSendOtpRequested(
    SendOtpRequested event,
    Emitter<RegisterState> emit,
  ) async {
    emit(SendOtpLoadInProgress());
    try {
      final result = await otpRepository.sendOtp(
        username: event.username,
        email: event.email,
        phone: event.phone,
      );
      emit(SendOtpLoadSuccess(result.message));
    } catch (e) {
      emit(SendOtpLoadFailure(e.toString()));
    }
  }

  Future<void> _onVerifyOtpRequested(
    VerifyOtpRequested event,
    Emitter<RegisterState> emit,
  ) async {
    emit(VerifyOtpLoadInProgress());
    try {
      final result = await otpRepository.verifyOtp(
        username: event.username,
        otp: event.otp,
        email: event.email,
        phone: event.phone,
      );
      emit(VerifyOtpLoadSuccess(result.message));
    } catch (e) {
      emit(VerifyOtpLoadFailure(e.toString()));
    }
  }

  // Academic Masters Handlers
  Future<void> _onBoardsFetched(
    BoardsFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(BoardsLoadInProgress());
    try {
      final result = await academicMasterRepository.getBoards();
      emit(BoardsLoadSuccess(result));
    } catch (e) {
      emit(BoardsLoadFailure(e.toString()));
    }
  }

  Future<void> _onSchoolsFetched(
    SchoolsFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(SchoolsLoadInProgress());
    try {
      final result = await academicMasterRepository.getSchools(
        boardId: event.boardId,
      );
      emit(SchoolsLoadSuccess(result));
    } catch (e) {
      emit(SchoolsLoadFailure(e.toString()));
    }
  }

  Future<void> _onClassesFetched(
    ClassesFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(ClassesLoadInProgress());
    try {
      final result = await academicMasterRepository.getClasses(
        boardId: event.boardId,
        schoolId: event.schoolId,
      );
      emit(ClassesLoadSuccess(result));
    } catch (e) {
      emit(ClassesLoadFailure(e.toString()));
    }
  }

  Future<void> _onYearsFetched(
    YearsFetched event,
    Emitter<RegisterState> emit,
  ) async {
    emit(YearsLoadInProgress());
    try {
      final result = await academicMasterRepository.getYears(
        boardId: event.boardId,
        schoolId: event.schoolId,
        classId: event.classId,
      );
      emit(YearsLoadSuccess(result));
    } catch (e) {
      emit(YearsLoadFailure(e.toString()));
    }
  }
}
