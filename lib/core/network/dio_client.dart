import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient() : dio = Dio(

    BaseOptions(
      baseUrl: 'http://157.173.221.226:3005/api',
      connectTimeout: Duration(seconds: 10), 
      receiveTimeout: Duration(seconds:10),
    headers: {
      'Content-Type': 'application/json'
    },)
  ){  dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          const token =
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMDQiLCJuYW1lIjoiU3V2b2ppdCBNb25kYWwiLCJ1c2VybmFtZSI6InN1dm9qaXQubW9uZGFsIiwicm9sZXMiOlt7InJvbGVfaWQiOjEsInJvbGVfbmFtZSI6InN0dWRlbnQifV0sInNpZCI6IjIwNCIsImV4cCI6MTc3MDc5NTYzOH0.wa_lF8FUyPwmDERDtuC-n4bDR7T9M6Vgcpr-yrjbKzg";

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