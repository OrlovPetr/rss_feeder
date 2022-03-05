import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/features/settings/bloc/settings_bloc.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/features/settings/res.dart';
import 'package:rss_feeder/ui/ui_kit.dart';

part '../widgets/settings_screen_button.dart';

/// Application settings screen
class SettingsScreen extends StatelessWidget {
  /// Default [SettingsScreen] constructor
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (BuildContext context, SettingsState state) {
        if (state.loadState == LoadState.loading) {
          return const LoaderScreen();
        }

        if (state.loadState == LoadState.failure) {
          return const ErrorScreen();
        }

        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.black54,
            title: const Text(SettingsScreenStrings.appBarTitle),
            leading: null,
          ),
          body: RefreshIndicator(
            onRefresh: () async {
              final SettingsBloc settingsBloc = context.read<SettingsBloc>();
              settingsBloc.add(FetchSettings());
            },
            color: Colors.black54,
            child: CustomScrollView(
              slivers: [
                _appThemeButton(context, state),
                _feedRefreshDurationButton(context, state),
                _appSettingsResetFeedButton(context, state),
                _appSettingsResetSettingsButton(context, state),
              ],
            ),
          ),
        );
      },
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
          onPressed: () {},
        ),
      );

  Widget _feedRefreshDurationButton(
    BuildContext context,
    SettingsState state,
  ) =>
      SliverToBoxAdapter(
        child: SettingsScreenButton(
          title: SettingsScreenStrings.appFeedRefreshDurationTitle,
          value: state.appSettings.refreshDuration.toString(),
          iconData: CupertinoIcons.clock,
          onPressed: () {},
        ),
      );

  Widget _appSettingsResetFeedButton(
    BuildContext context,
    SettingsState state,
  ) =>
      SliverToBoxAdapter(
        child: SettingsScreenButton(
          title: SettingsScreenStrings.appResetFeedTitle,
          iconData: CupertinoIcons.refresh,
          onPressed: () {},
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
