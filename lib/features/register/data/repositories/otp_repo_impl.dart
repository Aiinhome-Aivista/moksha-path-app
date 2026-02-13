import '../../domain/entities/otp_response.dart';
import '../../domain/repositories/otp_repository.dart';
import '../datasources/otp_remote_data_source.dart';

class OtpRepoImpl implements OtpRepository {
  final OtpRemoteDataSource remote;

  OtpRepoImpl(this.remote);

  @override
  Future<OtpResponse> sendOtp({
    required String username,
    String? email,
    String? phone,
  }) async {
    try {
      final data = await remote.sendOtp(
        username: username,
        email: email,
        phone: phone,
      );
      return data;
    } catch (e) {
      throw e.toString();
    }
  }

  @override
  Future<OtpResponse> verifyOtp({
    required String username,
    required String otp,
    String? email,
    String? phone,
  }) async {
    try {
      final data = await remote.verifyOtp(
        username: username,
        otp: otp,
        email: email,
        phone: phone,
      );
      return data;
    } catch (e) {
      throw e.toString();
    }
  }
}
