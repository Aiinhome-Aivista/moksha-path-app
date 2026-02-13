import '../entities/otp_response.dart';

abstract class OtpRepository {
  Future<OtpResponse> sendOtp({
    required String username,
    String? email,
    String? phone,
  });

  Future<OtpResponse> verifyOtp({
    required String username,
    required String otp,
    String? email,
    String? phone,
  });
}
