import '../entities/register.dart';

abstract class RegisterRepository {
  Future<List<Register>> getRegisters();
}