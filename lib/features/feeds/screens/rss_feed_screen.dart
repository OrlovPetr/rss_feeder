import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/features/favorites/bloc/favorites_bloc.dart';
import 'package:rss_feeder/features/feeds/bloc/rss_feed_bloc.dart';
import 'package:rss_feeder/features/feeds/models/rss_feed_item.dart';
import 'package:rss_feeder/features/feeds/screens/feed_webview.dart';
import 'package:rss_feeder/features/feeds/screens/feeds_screen.dart';
import 'package:rss_feeder/features/settings/bloc/settings_bloc.dart';
import 'package:rss_feeder/services/theme_service.dart';
import 'package:rss_feeder/ui/ui_kit.dart';

part '../widgets/rss_feed_app_bar.dart';
part '../widgets/rss_feed_body.dart';
part '../widgets/rss_feed_item_widget.dart';

/// Application chosen RSS feed screen
class RSSFeedScreen extends StatelessWidget {
  /// Default [RSSFeedScreen] constructor
  const RSSFeedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsState settingsState = context.read<SettingsBloc>().state;
    final ThemeData themeData = ThemeService.currentThemeByContext(
        context, settingsState.appSettings.appThemeStyle);

    return BlocBuilder<RSSFeedBloc, RSSFeedState>(
      builder: (BuildContext context, RSSFeedState state) => Scaffold(
        appBar: RSSFeedAppBar(state: state),
        body: RefreshIndicator(
          onRefresh: () async {
            context.read<RSSFeedBloc>().add(GetRSSFeed(uri: state.uri));
          },
          color: ThemeService.refreshIndicatorColor(themeData),
          child: state.loadState == LoadState.loading
              ? const LoaderScreen()
              : state.loadState == LoadState.failure
                  ? const ErrorScreen()
                  : RSSFeedBody(state: state),
        ),
      ),
    );
  }
}
