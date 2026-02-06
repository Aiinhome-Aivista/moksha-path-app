import 'package:get_it/get_it.dart';
import 'package:moksha_path/features/auth/di/auth_di.dart';
import '../network/dio_client.dart';



final sl = GetIt.instance;

Future<void> setupLocator() async {
  // CORE
  sl.registerLazySingleton<DioClient>(() => DioClient());

  

   // FEATURES
  // mason:feature-registration
  registerAuth(sl);
 
  
 
}