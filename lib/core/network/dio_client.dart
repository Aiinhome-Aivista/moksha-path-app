import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(

    BaseOptions(
      baseUrl: 'https://eduadaptapi-b7dkajhffjcgd8ab.canadacentral-01.azurewebsites.net/api',
      //  baseUrl: 'http://157.173.221.226:3005/api',
      connectTimeout: Duration(seconds: 10), 
      receiveTimeout: Duration(seconds:10),
    headers: {
      'Content-Type': 'application/json'
    },)
  ){  dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          const token =
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMDciLCJuYW1lIjoiUHJvZGlwIiwidXNlcm5hbWUiOiJwcm9kaXAiLCJyb2xlcyI6W3sicm9sZV9pZCI6MSwicm9sZV9uYW1lIjoic3R1ZGVudCJ9XSwic2lkIjoiMjA2IiwiZXhwIjoxNzcwODAzMjE5fQ.DtS1qzo0SbQHZklAG9XIc4yhMS3w5ZsAxNkASV6uze8";

          options.headers['Authorization'] = 'Bearer $token';

          handler.next(options);
        },
      ),
    );

    // Logger interceptor
    dio.interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
      ),
    );}
 
  
}