import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl: 'http://157.173.221.226:3005/api',
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          const token =
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI4NSIsIm5hbWUiOiJQcm9kaXAgS3VtYXIgTWFsIiwidXNlcm5hbWUiOiJwaW5rdTY3c3M5Iiwicm9sZXMiOlt7InJvbGVfaWQiOjMsInJvbGVfbmFtZSI6InRlYWNoZXIifV0sInNpZCI6IjE1MyIsImV4cCI6MTc3MDcwNDk1MH0.-arlcSL6zX1ridQvzJKzXlX-Qezj7z9Bqw5DnDy9P6Y";

          options.headers['Authorization'] = 'Bearer $token';

          handler.next(options);
        },
      ),
    );

    // Logger interceptor
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
