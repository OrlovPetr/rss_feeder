import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/core/exceptions/exceptions.dart';
import 'package:rss_feeder/core/extensions/list_extension.dart';
import 'package:rss_feeder/features/favorites/bloc/favorites_bloc.dart';
import 'package:rss_feeder/features/feeds/bloc/rss_feed_bloc.dart';
import 'package:rss_feeder/features/settings/bloc/settings_bloc.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/services/theme_service.dart';
import 'package:rss_feeder/ui/ui_kit.dart';

part '../res.dart';
part '../widgets/settings_app_theme_picker.dart';
part '../widgets/settings_refresh_duration_picker.dart';
part '../widgets/settings_screen_button.dart';

/// Application settings screen
class SettingsScreen extends StatefulWidget {
  /// Default [SettingsScreen] constructor
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  late int _refreshDurationIndex;

  late int _appThemeIndex;

  @override
  void initState() {
    final SettingsState settingsState = context.read<SettingsBloc>().state;
    _refreshDurationIndex = SettingsResources.refreshDurationOptions
        .getIndex(settingsState.appSettings.refreshDuration);
    _appThemeIndex =
        AppThemeStyle.values.getIndex(settingsState.appSettings.appThemeStyle);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.black54,
        title: const Text(SettingsScreenStrings.appBarTitle),
        leading: null,
      ),
      body: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) {
          final ThemeData themeData = ThemeService.currentThemeByContext(
              context, state.appSettings.appThemeStyle);

          return RefreshIndicator(
            onRefresh: () async {
              final SettingsBloc settingsBloc = context.read<SettingsBloc>();
              settingsBloc.add(FetchSettings());
            },
            color: ThemeService.refreshIndicatorColor(themeData),
            child: state.loadState == LoadState.loading
                ? const LoaderScreen()
                : state.loadState == LoadState.failure
                    ? const ErrorScreen()
                    : CustomScrollView(
                        slivers: [
                          _appThemeButton(context, state),
                          _feedRefreshDurationButton(context, state),
                          _appSettingsResetFeedButton(context, state),
                          _appSettingsResetSettingsButton(context, state),
                        ],
                      ),
          );
        },
      ),
    );
  }

  Widget _appThemeButton(
    BuildContext context,
    SettingsState state,
  ) =>
      SliverToBoxAdapter(
        child: SettingsScreenButton(
          title: SettingsScreenStrings.appThemeTitle,
          value: state.appSettings.appThemeStyle.label,
          iconData: CupertinoIcons.color_filter,
          onPressed: () {
            showCupertinoModalPopup<bool?>(
              context: context,
              builder: (BuildContext context) => FixedBottomSheet(
                onCancel: () {
                  Navigator.of(context).pop(false);
                },
                onAccept: () {
                  Navigator.of(context).pop(true);
                },
                content: SettingsAppThemePicker(
                  onSelectedItemChanged: (int value) {
                    setState(() {
                      _appThemeIndex = value;
                    });
                  },
                ),
              ),
            ).then((bool? value) {
              _appThemeButtonOnThen(context, value);
            }).onError((error, stackTrace) {
              _appThemeButtonOnError(context, error, stackTrace);
            });
          },
        ),
      );

  void _appThemeButtonOnThen(BuildContext context, bool? value) {
    if (value ?? false) {
      setState(() {
        final SettingsBloc settingsBloc = context.read<SettingsBloc>();
        final AppSettings newAppSettings = AppSettings(
          appThemeStyle: AppThemeStyle.values[_appThemeIndex],
          refreshDuration: settingsBloc.state.appSettings.refreshDuration,
        );
        settingsBloc.add(UpdateSettings(appSettings: newAppSettings));
      });
    } else {
      setState(() {
        final SettingsBloc settingsBloc = context.read<SettingsBloc>();
        _appThemeIndex = AppThemeStyle.values
            .getIndex(settingsBloc.state.appSettings.appThemeStyle);
      });
    }
  }

  void _appThemeButtonOnError(
    BuildContext context,
    Object? error,
    StackTrace stackTrace,
  ) {
    final SettingsBloc settingsBloc = context.read<SettingsBloc>();
    _appThemeIndex = AppThemeStyle.values
        .getIndex(settingsBloc.state.appSettings.appThemeStyle);
    setState(() {
      throw SystemException(
        title: 'Системная ошибка',
        message: 'Не удалось изменить тему приложения',
        name: 'SettingsScreen._appThemeButton',
        stackTrace: stackTrace,
      );
    });
  }

  Widget _feedRefreshDurationButton(
    BuildContext context,
    SettingsState state,
  ) =>
      SliverToBoxAdapter(
        child: SettingsScreenButton(
          title: SettingsScreenStrings.appFeedRefreshDurationTitle,
          value: (state.appSettings.refreshDuration / 60).toStringAsFixed(0),
          iconData: CupertinoIcons.clock,
          onPressed: () {
            showCupertinoModalPopup<bool?>(
              context: context,
              builder: (BuildContext context) => FixedBottomSheet(
                onCancel: () {
                  Navigator.of(context).pop(false);
                },
                onAccept: () {
                  Navigator.of(context).pop(true);
                },
                content: SettingsRefreshDurationPicker(
                  onSelectedItemChanged: (int value) {
                    setState(() {
                      _refreshDurationIndex = value;
                    });
                  },
                ),
              ),
            ).then((bool? value) {
              _feedRefreshDurationButtonOnThen(context, value);
            }).onError((error, stackTrace) {
              _feedRefreshDurationButtonOnError(context, error, stackTrace);
            });
          },
        ),
      );

  void _feedRefreshDurationButtonOnThen(
    BuildContext context,
    bool? value,
  ) {
    if (value ?? false) {
      setState(() {
        final SettingsBloc settingsBloc = context.read<SettingsBloc>();
        final RSSFeedBloc rssFeedBloc = context.read<RSSFeedBloc>();
        final int refreshDuration =
            SettingsResources.refreshDurationOptions[_refreshDurationIndex];
        final AppSettings newAppSettings = AppSettings(
          appThemeStyle: settingsBloc.state.appSettings.appThemeStyle,
          refreshDuration: refreshDuration,
        );
        settingsBloc.add(UpdateSettings(appSettings: newAppSettings));
        rssFeedBloc.add(
            UpdateRefreshDurationRSSFeed(refreshDuration: refreshDuration));
      });
    } else {
      setState(() {
        final SettingsBloc settingsBloc = context.read<SettingsBloc>();
        _refreshDurationIndex = SettingsResources.refreshDurationOptions
            .getIndex(settingsBloc.state.appSettings.refreshDuration);
      });
    }
  }

  void _feedRefreshDurationButtonOnError(
    BuildContext context,
    Object? error,
    StackTrace stackTrace,
  ) {
    setState(() {
      final SettingsBloc settingsBloc = context.read<SettingsBloc>();
      _refreshDurationIndex = SettingsResources.refreshDurationOptions
          .getIndex(settingsBloc.state.appSettings.refreshDuration);
      throw SystemException(
        title: 'Системная ошибка',
        message: 'Не удалось изменить частоту обновления потоков новостей',
        name: 'SettingsScreen._feedRefreshDurationButton',
        stackTrace: stackTrace,
      );
    });
  }

  Widget _appSettingsResetFeedButton(
    BuildContext context,
    SettingsState state,
  ) =>
      SliverToBoxAdapter(
        child: SettingsScreenButton(
          title: SettingsScreenStrings.appResetFeedTitle,
          iconData: CupertinoIcons.refresh,
          onPressed: () {
            context.read<FavoritesBloc>().add(FavoritesClear());
          },
        ),
      );

  Widget _appSettingsResetSettingsButton(
    BuildContext context,
    SettingsState state,
  ) =>
      SliverToBoxAdapter(
        child: SettingsScreenButton(
          title: SettingsScreenStrings.appResetSettingsTitle,
          iconData: CupertinoIcons.trash,
          onPressed: () {
            final SettingsBloc settingsBloc = context.read<SettingsBloc>();
            settingsBloc.add(ResetSettings());
          },
        ),
      );
}
