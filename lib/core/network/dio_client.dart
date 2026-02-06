import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(

    BaseOptions(
      baseUrl: 'http://157.173.221.226:3005',
      connectTimeout: Duration(seconds: 10), 
      receiveTimeout: Duration(seconds:10),
    headers: {
      'Content-Type': 'application/json'
    },)
  ){ dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true,error: true));}
 
  
}