// import 'package:flutter/material.dart';
import 'dart:developer';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/auth/data/models/academic_board_model.dart';

// This is our abs class for the api call
abstract class AcademicBoardRemoteDataSource {
  Future<List<AcademicBoardModel>> fetchAcademicBoards();
}

// this is our concrete class of the implementation of the above abs class
class AcademicBoardRemoteDataSourceImpl
    implements AcademicBoardRemoteDataSource {
  final DioClient dio;

  AcademicBoardRemoteDataSourceImpl(this.dio);

  @override
  Future<List<AcademicBoardModel>> fetchAcademicBoards() async {
    try {
      final response = await dio.dio.get(ApiEndPoints.academicMaster);
      // log("response: ${response.data}");
      // I've commented these because, this is business logic and this should be flutter free
      // debugPrint("debug ${response.data['data']}");
      // debugPrint("hello this is printing");

      final List data = response.data['data'];
      // log("Api Respone: $data");
      // print("response: ${response.data}");

      return data.map((e) => AcademicBoardModel.fromJson(e)).toList();
    } catch (e) {
      // throw e.toString();
      throw Exception(e);
    }
  }
}
