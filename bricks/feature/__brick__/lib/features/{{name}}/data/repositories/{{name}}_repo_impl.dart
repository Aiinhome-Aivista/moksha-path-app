import '../../domain/entities/{{name}}.dart';
import '../../domain/repositories/{{name}}_repository.dart';
import '../datasources/{{name}}_remote_data_source.dart';
import '../models/{{name}}_model.dart';

class {{name.pascalCase()}}RepoImpl implements {{name.pascalCase()}}Repository {
  final {{name.pascalCase()}}RemoteDataSource remote;

  {{name.pascalCase()}}RepoImpl(this.remote);

  @override
  Future<List<{{name.pascalCase()}}>> get{{name.pascalCase()}}s() async {

    try {

       final data = await remote.fetch{{name.pascalCase()}}s();
    return data.map((e) => {{name.pascalCase()}}Model.fromJson(e as Map<String, dynamic>)).toList();
      
    } catch (e) {
      throw e.toString();
    }
   
  }
}