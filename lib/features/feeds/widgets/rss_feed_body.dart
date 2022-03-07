part of '../screens/rss_feed_screen.dart';

/// [RSSFeedScreen] body
class RSSFeedBody extends StatelessWidget {
  /// [RSSFeedState] state with RSS feed data
  final RSSFeedState state;

  /// Default [RSSFeedBody] constructor
  const RSSFeedBody({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<RSSFeedItem> items =
        (state.appRss?.items.isNotEmpty ?? false) ? state.appRss!.items : [];

    if (items.isEmpty) {
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Text(
          RSSFeedScreenStrings.emptyListMessage,
          style: Theme.of(context).textTheme.headline6!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: ListView.builder(
        itemCount: items.length,
        itemBuilder: (BuildContext context, int index) => RSSFeedItemWidget(
          item: items[index],
          index: index,
          length: items.length,
        ),
      ),
    );
  }
}
