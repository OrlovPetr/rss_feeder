import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/models/container.dart';
import 'package:rss_feeder/core/models/route.dart';
import 'package:rss_feeder/features/settings/bloc/settings_bloc.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';

/// Main application widget
class AppMainWidget extends StatelessWidget {
  /// Main application [AppContainer] entity
  final AppContainer container;

  /// Application settings initial entity
  final AppSettings appSettings;

  final AppRouter _appRouter;

  /// Default [AppMainWidget] constructor
  AppMainWidget({
    Key? key,
    required this.container,
    required this.appSettings,
  })  : _appRouter = AppRouter(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SettingsBloc>(
          create: (BuildContext context) => SettingsBloc(
            appSettings: appSettings,
            appLogger: container.appLogger,
            settingsRepository: container.settingsRepository,
          ),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) => MaterialApp(
          initialRoute: Routes.home.name,
          routes: _appRouter.routes(context),
          builder: (BuildContext context, Widget? widget) => Theme(
            data: _getTheme(context, state),
            child: Scaffold(),
          ),
        ),
      ),
    );
  }

  ThemeData _getTheme(BuildContext context, SettingsState state) {
    switch (state.appSettings.appThemeStyle) {
      case AppThemeStyle.system:
        {
          final Brightness brightness =
              MediaQuery.of(context).platformBrightness;
          bool isDarkMode = brightness == Brightness.dark;

          return isDarkMode ? ThemeData.dark() : ThemeData.light();
        }
      case AppThemeStyle.dark:
        return ThemeData.dark();
      case AppThemeStyle.light:
      default:
        return ThemeData.light();
    }
  }
}
