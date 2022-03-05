// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettings _$AppSettingsFromJson(Map<String, dynamic> json) => AppSettings(
      appThemeStyle: $enumDecode(_$AppThemeStyleEnumMap, json['appThemeStyle']),
      refreshDuration: json['refreshDuration'] as int,
    );

Map<String, dynamic> _$AppSettingsToJson(AppSettings instance) =>
    <String, dynamic>{
      'appThemeStyle': _$AppThemeStyleEnumMap[instance.appThemeStyle],
      'refreshDuration': instance.refreshDuration,
    };

const _$AppThemeStyleEnumMap = {
  AppThemeStyle.light: 'light',
  AppThemeStyle.dark: 'dark',
  AppThemeStyle.system: 'system',
};
