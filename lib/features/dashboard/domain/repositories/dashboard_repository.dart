import '../entities/dashboard.dart';

abstract class DashboardRepository {
  Future<List<Dashboard>> getDashboards();
}