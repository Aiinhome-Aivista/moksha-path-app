import 'package:flutter/widgets.dart';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/auth/data/models/roles_model.dart';

abstract class RolesRemoteDataSource {
  Future<List<RoleModel>> fetchRoles();
}

class RolesRemoteDataSourceImpl implements RolesRemoteDataSource {
  final DioClient dio;
  RolesRemoteDataSourceImpl(this.dio);

  @override
  Future<List<RoleModel>> fetchRoles() async {
    final response = await dio.dio.get(ApiEndPoints.roles);

    final List data = response.data['data'];

    final List<RoleModel> recData = data.map((e) => RoleModel.fromJson(e)).toList();
    // debugPrint(recData.toString());
    
    return recData;
  }
}
