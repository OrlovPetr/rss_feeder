part of 'settings_bloc.dart';

/// [SettingsBloc] state
class SettingsState extends Equatable {
  /// [LoadState] entity
  final LoadState loadState;

  /// [AppSettings] entity
  final AppSettings appSettings;

  /// Default [SettingsState] constructor
  const SettingsState({
    required this.loadState,
    required this.appSettings,
  });

  /// Copy with
  SettingsState copyWith({
    LoadState? loadState,
    AppSettings? appSettings,
  }) {
    return SettingsState(
      loadState: loadState ?? this.loadState,
      appSettings: appSettings ?? this.appSettings,
    );
  }

  @override
  String toString() =>
      'SettingsState ($hashCode): {loadState : $loadState | appSettings : $appSettings}';

  @override
  List<Object?> get props => [
        loadState,
        appSettings,
      ];
}
