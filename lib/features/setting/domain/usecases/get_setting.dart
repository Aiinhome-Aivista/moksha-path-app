import '../entities/setting.dart';
import '../repositories/setting_repository.dart';

class GetSetting {
  final SettingRepository repository;

  GetSetting(this.repository);

  Future<List<Setting>> call() {
    return repository.getSettings();
  }
}