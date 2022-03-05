import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/features/settings/repository/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

/// [SettingsBloc]
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final SettingsRepository _settingsRepository;

  /// Default [SettingsBloc] constructor
  SettingsBloc({
    required AppSettings appSettings,
    required SettingsRepository settingsRepository,
  })  : _settingsRepository = settingsRepository,
        super(
          SettingsState(
            loadState: LoadState.initial,
            appSettings: appSettings,
          ),
        );

  @override
  Stream<SettingsState> mapEventToState(SettingsEvent event) async* {
    if (event is FetchSettings) {
      yield* _fetchSettingsToState(event);
    } else if (event is UpdateSettings) {
      yield* _updateSettingsToState(event);
    } else if (event is ResetSettings) {
      yield* _resetSettingsToState(event);
    }
  }

  Stream<SettingsState> _fetchSettingsToState(FetchSettings event) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      final AppSettings appSettings = await _settingsRepository.get();

      yield state.copyWith(
        loadState: LoadState.success,
        appSettings: appSettings,
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
      rethrow;
    }
  }

  Stream<SettingsState> _updateSettingsToState(UpdateSettings event) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      await _settingsRepository.save(event.appSettings);

      yield state.copyWith(
        loadState: LoadState.success,
        appSettings: event.appSettings,
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
      rethrow;
    }
  }

  Stream<SettingsState> _resetSettingsToState(ResetSettings event) async* {
    try {
      yield state.copyWith(loadState: LoadState.loading);

      await _settingsRepository.reset();

      yield state.copyWith(
        loadState: LoadState.success,
        appSettings: AppSettings(
          appThemeStyle: AppThemeStyle.light,
          refreshDuration: SettingsRepository.defaultDuration,
        ),
      );
    } catch (e) {
      yield state.copyWith(loadState: LoadState.failure);
      rethrow;
    }
  }
}
