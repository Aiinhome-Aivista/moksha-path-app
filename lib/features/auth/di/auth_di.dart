import 'package:get_it/get_it.dart';
import 'package:moksha_path/features/auth/data/datasources/academic_board_remote_data_source.dart';
import 'package:moksha_path/features/auth/data/datasources/roles_remote_data_source.dart';
import 'package:moksha_path/features/auth/data/repositories/academic_board_repo_impl.dart';
import 'package:moksha_path/features/auth/data/repositories/roles_repo_impl.dart';
import 'package:moksha_path/features/auth/domain/repositories/academic_board_repository.dart';
import 'package:moksha_path/features/auth/domain/repositories/roles_repository.dart';
import '../data/datasources/auth_remote_data_source.dart';
import '../data/repositories/auth_repo_impl.dart';
import '../domain/repositories/auth_repository.dart';

void registerAuth(GetIt sl) {
  // DATA SOURCES
  sl.registerLazySingleton<AuthRemoteDataSource>(
    () => AuthRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<AcademicBoardRemoteDataSource>(
    () => AcademicBoardRemoteDataSourceImpl(sl()),
  );

  // roles

  sl.registerLazySingleton<RolesRemoteDataSource>(
    () => RolesRemoteDataSourceImpl(sl()),
  );

  // REPOSITORIES

  sl.registerLazySingleton<AuthRepository>(() => AuthRepoImpl(sl()));
  sl.registerLazySingleton<AcademicBoardRepository>(
    () => AcademicBoardRepoImpl(sl()),
  );

  // roles

  sl.registerLazySingleton<RolesRepository>(
  () => RolesRepositoryImpl(sl()),
);
}
