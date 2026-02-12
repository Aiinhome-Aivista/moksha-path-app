import 'package:dio/dio.dart';

class DioClient {
  final Dio dio;

  DioClient()
    : dio = Dio(
        BaseOptions(
          baseUrl:
              'https://eduadaptapi-b7dkajhffjcgd8ab.canadacentral-01.azurewebsites.net/api',
          //  baseUrl: 'http://157.173.221.226:3005/api',
          connectTimeout: Duration(seconds: 10),
          receiveTimeout: Duration(seconds: 10),
          headers: {'Content-Type': 'application/json'},
        ),
      ) {
    dio.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) async {
          const token =
              "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMzUiLCJuYW1lIjoiUHJpeWEgZGFzIiwidXNlcm5hbWUiOiJkYXNwcml5YSIsInJvbGVzIjpbeyJyb2xlX2lkIjoyLCJyb2xlX25hbWUiOiJwYXJlbnQifV0sInNpZCI6IjI2MiIsImV4cCI6MTc3MDk2OTY3NH0.dcBRB4aztAp6qrUpys37i-plyPNmcVR0xbvnzdquDMU";

          options.headers['Authorization'] = 'Bearer $token';

          handler.next(options);
        },
      ),
    );

    // Logger interceptor
    dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
  }
}
