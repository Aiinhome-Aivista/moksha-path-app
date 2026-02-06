import '../../domain/entities/setting.dart';

class SettingModel extends Setting {
  const SettingModel({required super.id, required super.name});

  factory SettingModel.fromJson(Map<String, dynamic> json) {
    return SettingModel(id: json['id'], name: json['name']);
  }
}
