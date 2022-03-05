import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';
import 'package:rss_feeder/core/interfaces/json_serializable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'local_storage_logger.g.dart';

/// Application local storage message entity
@JsonSerializable()
class LocalStorageLogMessage implements AppJSONSerializable {
  /// Name of case source
  final String name;

  /// Message with info about case
  final String message;

  /// Date and time of case
  final DateTime date;

  /// Default [LocalStorageLogMessage] constructor
  LocalStorageLogMessage({
    required this.name,
    required this.message,
    required this.date,
  });

  /// [LabOrderResults.fromJson]
  factory LocalStorageLogMessage.fromJson(Map<String, dynamic> json) =>
      _$LocalStorageLogMessageFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$LocalStorageLogMessageToJson(this);
}

/// Application local storage logger
class LocalStorageLogger {
  static const String _key = 'local-storage-log';

  /// Log message to local storage
  void log({
    required String message,
    required String name,
  }) async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final DateTime now = DateTime.now();
    final LocalStorageLogMessage localStorageLogMessage =
        LocalStorageLogMessage(
      name: name,
      message: message,
      date: now,
    );
    final List<String> newEntity = [
      jsonEncode(localStorageLogMessage.toJson()),
    ];
    final List<String>? data = _prefs.getStringList(_key);
    final List<String> newData = (data?.isNotEmpty ?? false)
        ? [
            ...data!,
            ...newEntity,
          ]
        : newEntity;
    await _prefs.setStringList(_key, newData);
  }

  /// Return from local storage list of [LocalStorageLogMessage]
  Future<List<LocalStorageLogMessage>> get messages async {
    final SharedPreferences _prefs = await SharedPreferences.getInstance();
    final List<String> data = _prefs.getStringList(_key) ?? [];
    return data
        .map<LocalStorageLogMessage>(
          (String entity) =>
              LocalStorageLogMessage.fromJson(jsonDecode(entity)),
        )
        .toList();
  }
}
