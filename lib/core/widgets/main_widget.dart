import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/models/container.dart';
import 'package:rss_feeder/core/models/route.dart';
import 'package:rss_feeder/features/favorites/bloc/favorites_bloc.dart';
import 'package:rss_feeder/features/feeds/bloc/feeds_bloc.dart';
import 'package:rss_feeder/features/feeds/bloc/rss_feed_bloc.dart';
import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';
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

  /// Application initial favorites entity list
  final List<RSSFeedItem> favorites;

  final AppRouter _appRouter;

  /// Default [AppMainWidget] constructor
  AppMainWidget({
    Key? key,
    required this.container,
    required this.appSettings,
    required this.favorites,
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
          create: (BuildContext context) => RSSFeedBloc(
            rssFeedRepository: container.rssFeedRepository,
            refreshDuration: appSettings.refreshDuration,
          ),
        ),
        BlocProvider<FavoritesBloc>(
          create: (BuildContext context) => FavoritesBloc(
            favorites: favorites,
            favoritesRepository: container.favoritesRepository,
          ),
        ),
      ],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (BuildContext context, SettingsState state) => MaterialApp(
          navigatorKey: Catcher.navigatorKey,
          theme: _getTheme(state),
          initialRoute: Routes.home.name,
          routes: _appRouter.routes(context),
        ),
      ),
    );
  }

  ThemeData _getTheme(SettingsState state) =>
      ThemeService.currentTheme(state.appSettings.appThemeStyle);
}
