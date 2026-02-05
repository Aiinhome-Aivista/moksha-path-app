import '../entities/setting.dart';

abstract class SettingRepository {
  Future<List<Setting>> getSettings();
}