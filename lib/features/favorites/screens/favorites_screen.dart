import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/features/favorites/bloc/favorites_bloc.dart';
import 'package:rss_feeder/features/favorites/res.dart';
import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';
import 'package:rss_feeder/features/feeds/screens/feed_webview.dart';
import 'package:rss_feeder/features/settings/bloc/settings_bloc.dart';
import 'package:rss_feeder/services/theme_service.dart';
import 'package:rss_feeder/ui/ui_kit.dart';

part '../widgets/favorites_body.dart';
part '../widgets/favorites_item.dart';

/// Favorites RSS items screen
class FavoritesScreen extends StatelessWidget {
  /// Default [FavoritesScreen] constructor
  const FavoritesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsState settingsState = context.read<SettingsBloc>().state;
    final ThemeData themeData = ThemeService.currentTheme(
        context, settingsState.appSettings.appThemeStyle);

    return BlocBuilder<FavoritesBloc, FavoritesState>(
      builder: (BuildContext context, FavoritesState state) {
        return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            backgroundColor: ThemeService.refreshIndicatorColor(themeData),
            title:
                const Text(FavoritesScreenStrings.favoritesScreenAppBarTitle),
            leading: null,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              context.read<FavoritesBloc>().add(FavoritesRefresh());
            },
            color: ThemeService.refreshIndicatorColor(themeData),
            child: state.loadState == LoadState.loading
                ? const LoaderScreen()
                : state.loadState == LoadState.failure
                    ? const ErrorScreen()
                    : FavoritesBody(state: state),
          ),
        );
      },
    );
  }
}
