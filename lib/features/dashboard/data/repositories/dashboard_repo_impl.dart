import '../../domain/entities/dashboard.dart';
import '../../domain/repositories/dashboard_repository.dart';
import '../datasources/dashboard_remote_data_source.dart';
import '../models/dashboard_model.dart';

class DashboardRepoImpl implements DashboardRepository {
  final DashboardRemoteDataSource remote;

  DashboardRepoImpl(this.remote);

  @override
  Future<List<Dashboard>> getDashboards() async {

    try {

       final data = await remote.fetchDashboards();
    return data.map((e) => DashboardModel.fromJson(e as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw e.toString();
    }
   
  }
}