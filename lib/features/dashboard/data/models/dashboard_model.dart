import '../../domain/entities/dashboard.dart';

class DashboardModel extends Dashboard {
  const DashboardModel({required super.id});

  factory DashboardModel.fromJson(Map<String, dynamic> json) {
    return DashboardModel(
      id: json['id'],
    );
  }
}