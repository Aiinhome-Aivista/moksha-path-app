import '../entities/dashboard.dart';
import '../repositories/dashboard_repository.dart';

class GetDashboard {
  final DashboardRepository repository;

  GetDashboard(this.repository);

  Future<List<Dashboard>> call() {
    return repository.getDashboards();
  }
}