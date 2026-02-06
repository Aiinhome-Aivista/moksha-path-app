import '../entities/auth.dart';
import '../repositories/auth_repository.dart';

class GetAuth {
  final AuthRepository repository;

  GetAuth(this.repository);

  Future<List<Auth>> call() {
    return repository.getAuths();
  }
}

