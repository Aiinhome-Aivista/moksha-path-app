import 'package:flutter/material.dart';
import 'package:moksha_path/core/network/api_endpoints.dart';
import 'package:moksha_path/core/network/dio_client.dart';
import 'package:moksha_path/features/register/data/models/otp_response_model.dart';

abstract class OtpRemoteDataSource {
  Future<OtpResponseModel> sendOtp({
    required String username,
    String? email,
    String? phone,
  });

  Future<OtpResponseModel> verifyOtp({
    required String username,
    required String otp,
    String? email,
    String? phone,
  });
}

class OtpRemoteDataSourceImpl implements OtpRemoteDataSource {
  final DioClient dio;

  OtpRemoteDataSourceImpl(this.dio);

  @override
  Future<OtpResponseModel> sendOtp({
    required String username,
    String? email,
    String? phone,
  }) async {
    try {
      final Map<String, dynamic> body = {'username': username};
      if (email != null) body['email'] = email;
      if (phone != null) {
        body['phone'] = phone.startsWith('+') ? phone : '+91$phone';
      }

      final response = await dio.dio.post(ApiEndPoints.sendOtp, data: body);
      debugPrint("debug ${response.data}");
      return OtpResponseModel.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<OtpResponseModel> verifyOtp({
    required String username,
    required String otp,
    String? email,
    String? phone,
  }) async {
    try {
      final Map<String, dynamic> body = {'username': username, 'otp': otp};
      if (email != null) body['email'] = email;
      if (phone != null) {
        body['phone'] = phone.startsWith('+') ? phone : '+91$phone';
      }

      final response = await dio.dio.post(ApiEndPoints.verifyOtp, data: body);
      debugPrint("debug ${response.data}");
      return OtpResponseModel.fromJson(response.data);
    } catch (e) {
      throw e.toString();
    }
  }
}
