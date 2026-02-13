import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import '../../data/models/user_profile_model.dart';
import 'package:flutter/material.dart';

abstract class UserProfileRemoteDataSource {
  Future<List<UserProfileModel>> fetchUserProfiles();
}

class UserProfileRemoteDataSourceImpl
    implements UserProfileRemoteDataSource {

  final DioClient dio;

  UserProfileRemoteDataSourceImpl(this.dio);

  @override
  Future<List<UserProfileModel>> fetchUserProfiles() async {

    try {

         final response = await dio.dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => UserProfileModel.fromJson(e))
        .toList();
      
    } catch (e) {

      throw e.toString();
      
    }
 
  }
}