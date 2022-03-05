import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/enums/load_state.dart';
import 'package:rss_feeder/features/feeds/bloc/feeds_bloc.dart';
import 'package:rss_feeder/features/feeds/models/feed.dart';
import 'package:rss_feeder/ui/ui_kit.dart';

part '../res.dart';
part '../widgets/category_item.dart';
part '../widgets/category_title.dart';
part '../widgets/feed_item.dart';

/// Application feeds screen
class FeedsScreen extends StatelessWidget {
  /// Default [FeedsScreen] constructor
  const FeedsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        title: const Text(FeedsScreenStrings.appBarTitle),
        leading: null,
      ),
      body: BlocBuilder<FeedsBloc, FeedsState>(
        builder: (BuildContext context, FeedsState state) {
          if (state.loadState == LoadState.loading) {
            return const LoaderScreen();
          }

          if (state.loadState == LoadState.failure) {
            return const ErrorScreen();
          }

          return CustomScrollView(
            slivers: _slivers(state),
          );
        },
      ),
    );
  }

  List<Widget> _slivers(FeedsState state) {
    final List<Widget> slivers = <Widget>[];

    for (int i = 0; i < state.filteredCategoriesList.length; i++) {
      final List<AppFeedTheme> feeds = state.filteredFeedsList
          .where((AppFeedTheme feed) =>
              feed.categories.contains(state.filteredCategoriesList[i].id))
          .toList();

      if (i == state.filteredCategoriesList.length - 1) {
        slivers.add(
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 50),
              child: CategoryItem(
                  title: state.filteredCategoriesList[i].name, feeds: feeds),
            ),
          ),
        );
      } else {
        slivers.add(
          SliverToBoxAdapter(
            child: CategoryItem(
                title: state.filteredCategoriesList[i].name, feeds: feeds),
          ),
        );
      }
    }

    return slivers;
  }
}
