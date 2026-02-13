import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl:
              'https://eduadaptapi-b7dkajhffjcgd8ab.canadacentral-01.azurewebsites.net/api',
          //  baseUrl: 'http://157.173.221.226:3005/api',
          connectTimeout: Duration(seconds: 30),
          receiveTimeout: Duration(seconds: 30),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          const token =
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxNjYiLCJuYW1lIjoiaGltYW5zaHUiLCJ1c2VybmFtZSI6ImhpbWFuc2h1Iiwicm9sZXMiOlt7InJvbGVfaWQiOjEsInJvbGVfbmFtZSI6InN0dWRlbnQifV0sInNpZCI6IjM0NCIsImV4cCI6MTc3MTA4MzY1MX0.HzqrXDuzHp8-7DyeuGuQSQ443Ug8a93JVzGJU3o4Cqk";

          options.headers['Authorization'] = 'Bearer $token';

          handler.next(options);
        },
      ),
    );

    // Logger interceptor
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
