part of 'auth_bloc.dart';

// @immutable → event objects shouldn’t change after creation (good)
// sealed → only classes in this file can extend AuthEvent
// AuthEvent → base type for all auth-related events
// That's why we're making every class final. 

@immutable
sealed class AuthEvent {}

final class AuthStarted
    extends AuthEvent {

  final String username;
  final String password;

  AuthStarted({
    required this.username,
    required this.password,
  });
}

final class AuthCompleted
    extends AuthEvent {}


final class AcademicMastersFetched
    extends AuthEvent {

      
    } 

    //  

final class RolesFetched extends AuthEvent{

}