part of 'settings_bloc.dart';

/// [SettingsEvent]
abstract class SettingsEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

/// [UpdateSettings]
class UpdateSettings extends SettingsEvent {
  /// New [AppSettings] instance for application
  final AppSettings appSettings;

  /// Default [UpdateSettings] constructor
  UpdateSettings({
    required this.appSettings,
  });

  @override
  List<Object?> get props => [
        ...super.props,
        appSettings,
      ];
}

/// [ResetSettings]
class ResetSettings extends SettingsEvent {}

/// [FetchSettings]
class FetchSettings extends SettingsEvent {}
