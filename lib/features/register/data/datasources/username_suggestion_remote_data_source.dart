import 'package:flutter/material.dart';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/register/data/models/username_suggestion_model.dart';

abstract class UsernameSuggestionRemoteDataSource {
  Future<UsernameSuggestionModel> fetchSuggestions(String name);
}

class UsernameSuggestionRemoteDataSourceImpl
    implements UsernameSuggestionRemoteDataSource {
  final DioClient dio;

  UsernameSuggestionRemoteDataSourceImpl(this.dio);

  @override
  Future<UsernameSuggestionModel> fetchSuggestions(String name) async {
    try {
      final response = await dio.dio.get(
        ApiEndPoints.usernameSuggestions,
        queryParameters: {'name': name},
      );
      debugPrint("debug ${response.data}");
      return UsernameSuggestionModel.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }
}
