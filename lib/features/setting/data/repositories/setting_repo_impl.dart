import '../../domain/entities/setting.dart';
import '../../domain/repositories/setting_repository.dart';
import '../datasources/setting_remote_data_source.dart';
import '../models/setting_model.dart';

class SettingRepoImpl implements SettingRepository {
  final SettingRemoteDataSource remote;

  SettingRepoImpl(this.remote);

  @override
  Future<List<Setting>> getSettings() async {
    final data = await remote.fetchSettings();
    return data.map((e) => SettingModel.fromJson(e as Map<String, dynamic>)).toList();
  }
}