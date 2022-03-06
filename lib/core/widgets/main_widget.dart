import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/models/container.dart';
import 'package:rss_feeder/core/models/route.dart';
import 'package:rss_feeder/features/feeds/bloc/feeds_bloc.dart';
import 'package:rss_feeder/features/feeds/bloc/rss_feed_bloc.dart';
import 'package:rss_feeder/features/home/bloc/home_tabs_navigator.dart';
import 'package:rss_feeder/features/settings/bloc/settings_bloc.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/services/theme_service.dart';

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
        BlocProvider<HomeTabsNavigatorCubit>(
          create: (BuildContext context) => HomeTabsNavigatorCubit(),
        ),
        BlocProvider<SettingsBloc>(
          create: (BuildContext context) => SettingsBloc(
            appSettings: appSettings,
            settingsRepository: container.settingsRepository,
          ),
        ),
        BlocProvider<FeedsBloc>(
          create: (BuildContext context) => FeedsBloc(
            feedRepository: container.feedRepository,
            fullCategoriesList: container.config.feedCategories,
            fullFeedsList: container.config.feeds,
          ),
        ),
        BlocProvider<RSSFeedBloc>(
          create: (BuildContext context) =>
              RSSFeedBloc(rssFeedRepository: container.rssFeedRepository),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) => MaterialApp(
          navigatorKey: Catcher.navigatorKey,
          theme: _getTheme(context, state),
          initialRoute: Routes.home.name,
          routes: _appRouter.routes(context),
        ),
      ),
    );
  }

  ThemeData _getTheme(BuildContext context, SettingsState state) =>
      ThemeService.currentTheme(context, state.appSettings.appThemeStyle);
}
