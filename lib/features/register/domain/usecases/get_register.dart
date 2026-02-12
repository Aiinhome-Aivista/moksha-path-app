import '../entities/register.dart';
import '../repositories/register_repository.dart';

class GetRegister {
  final RegisterRepository repository;

  GetRegister(this.repository);

  Future<List<Register>> call() {
    return repository.getRegisters();
  }
}