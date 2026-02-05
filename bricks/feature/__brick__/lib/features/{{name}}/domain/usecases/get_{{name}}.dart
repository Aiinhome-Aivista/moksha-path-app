import '../entities/{{name}}.dart';
import '../repositories/{{name}}_repository.dart';

class Get{{name.pascalCase()}} {
  final {{name.pascalCase()}}Repository repository;

  Get{{name.pascalCase()}}(this.repository);

  Future<List<{{name.pascalCase()}}>> call() {
    return repository.get{{name.pascalCase()}}s();
  }
}