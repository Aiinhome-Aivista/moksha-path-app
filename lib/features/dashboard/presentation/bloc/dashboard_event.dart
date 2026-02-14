part of 'dashboard_bloc.dart';

@immutable
sealed class DashboardEvent {}

final class DashboardStarted
    extends DashboardEvent {

  final String username;
  final String password;

  DashboardStarted({
    required this.username,
    required this.password,
  });
}

final class DashboardCompleted
    extends DashboardEvent {}