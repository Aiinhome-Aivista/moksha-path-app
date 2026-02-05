import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(

    BaseOptions(
      baseUrl: 'http://',
      connectTimeout: Duration(seconds: 10), 
      receiveTimeout: Duration(seconds:10),
    headers: {
      'Content-Type': 'application/json'
    },)
  ){ dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));}
 
  
}