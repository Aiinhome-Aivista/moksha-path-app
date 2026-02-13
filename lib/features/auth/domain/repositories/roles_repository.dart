import 'package:moksha_path/features/auth/domain/entities/roles.dart';

// Defining Repository 
abstract class RolesRepository {

  Future<List<Role>> getRoles();

}