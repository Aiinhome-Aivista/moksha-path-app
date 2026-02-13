import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl:
              'https://eduadaptapi-b7dkajhffjcgd8ab.canadacentral-01.azurewebsites.net/api',
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          const token =
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI4MiIsIm5hbWUiOiJQcm9kaXAgS3VtYXIgTWFsIiwidXNlcm5hbWUiOiJwcm9kaXAxMjYiLCJyb2xlcyI6bnVsbCwic2lkIjoiMjMzIiwiZXhwIjoxNzcwOTU5NDQwfQ.cSuHxL1EWocRRqEG_h8-8z_EEKr9OHui-0Ex0q124hw";

          options.headers['Authorization'] = 'Bearer $token';

          handler.next(options);
        },
      ),
    );

    // Logger interceptor
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
