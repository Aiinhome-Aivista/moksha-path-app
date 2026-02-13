import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import '../../data/models/boards_model.dart';
import 'package:flutter/material.dart';

abstract class BoardsRemoteDataSource {
  Future<List<BoardsModel>> fetchBoardss();
}

class BoardsRemoteDataSourceImpl
    implements BoardsRemoteDataSource {

  final DioClient dio;

  BoardsRemoteDataSourceImpl(this.dio);

  @override
  Future<List<BoardsModel>> fetchBoardss() async {

    try {

         final response = await dio.dio.get(ApiEndPoints.login);
    debugPrint("debug \${response.data['data']}");

    final List data = response.data['data'];

    return data
        .map((e) => BoardsModel.fromJson(e))
        .toList();
      
    } catch (e) {

      throw e.toString();
      
    }
 
  }
}