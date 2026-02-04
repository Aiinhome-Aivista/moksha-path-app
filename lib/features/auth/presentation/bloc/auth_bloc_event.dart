part of 'auth_bloc_bloc.dart';

@immutable
sealed class AuthBlocEvent {}

final class AuthLoginRequested extends AuthBlocEvent{
     
     final String username;
     final String password;

     AuthLoginRequested({required this.username, required this.password});

}

final class AuthLogoutRequested extends AuthBlocEvent{}
