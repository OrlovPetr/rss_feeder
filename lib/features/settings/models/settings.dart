import 'package:json_annotation/json_annotation.dart';
import 'package:rss_feeder/core/interfaces/json_serializable.dart';

part 'settings.g.dart';

/// Application theme style state
enum AppThemeStyle {
  /// Light theme
  light,

  /// Dark theme
  dark,

  /// System dependent theme
  system,
}

/// Application [AppThemeStyle] extension
extension AppThemeStyleExt on AppThemeStyle {
  /// [AppThemeStyle] get [String] value
  String get label {
    switch (this) {
      case AppThemeStyle.system:
        return 'Управляется системой';
      case AppThemeStyle.dark:
        return 'Темная тема';
      case AppThemeStyle.light:
      default:
        return 'Светлая тема';
    }
  }

  /// Return [List] of [String] labels for each [AppThemeStyle] enum item.
  ///
  /// Uses for pickers, checkboxes, radios
  static List<String> get labels =>
      AppThemeStyle.values.map((AppThemeStyle e) => e.label).toList();
}

/// Application settings
@JsonSerializable()
class AppSettings implements AppJSONSerializable {
  /// Application theme state
  final AppThemeStyle appThemeStyle;

  /// Application RSS feed refresh duration in seconds
  final int refreshDuration;

  /// Default [AppSettings] constructor
  AppSettings({
    required this.appThemeStyle,
    required this.refreshDuration,
  });

  /// [LabOrderResults.fromJson]
  factory AppSettings.fromJson(Map<String, dynamic> json) =>
      _$AppSettingsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$AppSettingsToJson(this);

  @override
  String toString() {
    final Map<String, dynamic> entityData = toJson();
    final StringBuffer result = StringBuffer('AppSettings ($hashCode): {');
    final List<String> rawData = [];

    entityData.forEach((String key, dynamic value) {
      rawData.add('$key : $value');
    });

    result.write(rawData.join(' | '));
    result.write('}\n');
    return result.toString();
  }
}
