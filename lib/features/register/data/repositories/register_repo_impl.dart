import '../../domain/entities/register.dart';
import '../../domain/repositories/register_repository.dart';
import '../datasources/register_remote_data_source.dart';
import '../models/register_model.dart';

class RegisterRepoImpl implements RegisterRepository {
  final RegisterRemoteDataSource remote;

  RegisterRepoImpl(this.remote);

  @override
  Future<List<Register>> getRegisters() async {

    try {

       final data = await remote.fetchRegisters();
    return data.map((e) => RegisterModel.fromJson(e as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw e.toString();
    }
   
  }
}