import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/features/home/bloc/home_tabs_navigator.dart';
import 'package:rss_feeder/features/home/models/home_tab.dart';
import 'package:rss_feeder/features/home/widgets/home_widgets.dart';
import 'package:rss_feeder/features/settings/screens/settings_screen.dart';

/// Main App screen with bottom bar navigation
class HomeScreen extends StatelessWidget {
  /// Default [HomeScreen] constructor
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeTabsNavigatorCubit, HomeTab>(
      builder: (BuildContext context, HomeTab tab) => Scaffold(
        body: _body(tab),
        bottomNavigationBar: AppBottomNavigationBar(initTab: tab),
      ),
    );
  }

  Widget _body(HomeTab tab) {
    switch (tab) {
      case HomeTab.favorites:
        return Container(
          color: Colors.blue,
        );
      case HomeTab.settings:
        return const SettingsScreen();
      case HomeTab.home:
      default:
        return Container(
          color: Colors.orange,
        );
    }
  }
}
