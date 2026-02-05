import '../../domain/entities/auth.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/auth_remote_data_source.dart';
import '../models/auth_model.dart';

class AuthRepoImpl implements AuthRepository {
  final AuthRemoteDataSource remote;

  AuthRepoImpl(this.remote);

  @override
  Future<List<Auth>> getAuths() async {
    final data = await remote.fetchAuths();
    return data.map((e) => AuthModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}