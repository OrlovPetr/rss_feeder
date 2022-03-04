// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_storage_logger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalStorageLogMessage _$LocalStorageLogMessageFromJson(
        Map<String, dynamic> json) =>
    LocalStorageLogMessage(
      name: json['name'] as String,
      message: json['message'] as String,
      date: DateTime.parse(json['date'] as String),
    );

Map<String, dynamic> _$LocalStorageLogMessageToJson(
        LocalStorageLogMessage instance) =>
    <String, dynamic>{
      'name': instance.name,
      'message': instance.message,
      'date': instance.date.toIso8601String(),
    };
