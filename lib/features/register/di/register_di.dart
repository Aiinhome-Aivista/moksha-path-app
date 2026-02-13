import 'package:get_it/get_it.dart';
import 'package:moksha_path/features/register/data/datasources/username_suggestion_remote_data_source.dart';
import 'package:moksha_path/features/register/data/datasources/username_check_remote_data_source.dart';
import 'package:moksha_path/features/register/data/datasources/otp_remote_data_source.dart';
import 'package:moksha_path/features/register/data/repositories/username_suggestion_repo_impl.dart';
import 'package:moksha_path/features/register/data/repositories/username_check_repo_impl.dart';
import 'package:moksha_path/features/register/data/repositories/otp_repo_impl.dart';
import 'package:moksha_path/features/register/domain/repositories/username_suggestion_repository.dart';
import 'package:moksha_path/features/register/domain/repositories/username_check_repository.dart';
import 'package:moksha_path/features/register/domain/repositories/otp_repository.dart';

void registerRegister(GetIt sl) {
  // DATA SOURCES
  sl.registerLazySingleton<UsernameSuggestionRemoteDataSource>(
    () => UsernameSuggestionRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<UsernameCheckRemoteDataSource>(
    () => UsernameCheckRemoteDataSourceImpl(sl()),
  );

  sl.registerLazySingleton<OtpRemoteDataSource>(
    () => OtpRemoteDataSourceImpl(sl()),
  );

  // REPOSITORIES
  sl.registerLazySingleton<UsernameSuggestionRepository>(
    () => UsernameSuggestionRepoImpl(sl()),
  );

  sl.registerLazySingleton<UsernameCheckRepository>(
    () => UsernameCheckRepoImpl(sl()),
  );

  sl.registerLazySingleton<OtpRepository>(() => OtpRepoImpl(sl()));
}
