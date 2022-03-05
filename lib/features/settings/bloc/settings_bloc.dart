import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/core/logger/logger.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/features/settings/repository/settings_repository.dart';

part 'settings_event.dart';
part 'settings_state.dart';

/// [SettingsBloc]
class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  final AppLogger _appLogger;

  final SettingsRepository _settingsRepository;

  /// Default [SettingsBloc] constructor
  SettingsBloc({
    required AppSettings appSettings,
    required AppLogger appLogger,
    required SettingsRepository settingsRepository,
  })  : _appLogger = appLogger,
        _settingsRepository = settingsRepository,
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
    } catch (e, s) {
      const String name = 'SettingsBloc.mapEventToState(FetchSettings)';
      const String title = 'Ошибка получения данных';
      const String message =
          'Не удалось получить данные о настройках приложения';
      _appLogger.s(message: e.toString(), name: name, stackTrace: s);
      yield state.copyWith(loadState: LoadState.failure);
      throw SystemException(
        title: title,
        message: message,
        name: name,
      );
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
    } catch (e, s) {
      const String name = 'SettingsBloc.mapEventToState(UpdateSettings)';
      const String title = 'Ошибка обновления данных';
      const String message =
          'Не удалось обновить данные о настройках приложения';
      _appLogger.s(message: e.toString(), name: name, stackTrace: s);
      yield state.copyWith(loadState: LoadState.failure);
      throw SystemException(
        title: title,
        message: message,
        name: name,
      );
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
    } catch (e, s) {
      const String name = 'SettingsBloc.mapEventToState(ResetSettings)';
      const String title = 'Ошибка очистки данных';
      const String message =
          'Не удалось очистить данные о настройках приложения';
      _appLogger.s(message: e.toString(), name: name, stackTrace: s);
      yield state.copyWith(loadState: LoadState.failure);
      throw SystemException(
        title: title,
        message: message,
        name: name,
      );
    }
  }
}
