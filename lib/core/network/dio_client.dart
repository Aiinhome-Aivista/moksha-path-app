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
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI3MSIsIm5hbWUiOiJQYWJpdHJhIFNhcmthciIsInVzZXJuYW1lIjoic2Fya2FycGFiaXRyYTUxNyIsInJvbGVzIjpbeyJyb2xlX2lkIjoxLCJyb2xlX25hbWUiOiJzdHVkZW50In1dLCJzaWQiOiI4NCIsImV4cCI6MTc3MDQ3MjI4NH0.SVebVG6kcdFwqGzrl6DBg4YZx5nKvSIDubT5vm3H2zg";

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