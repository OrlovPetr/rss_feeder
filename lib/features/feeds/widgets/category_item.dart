part of '../screens/feeds_screen.dart';

/// [CategoryItem]
class CategoryItem extends StatelessWidget {
  /// Category title widget
  final String title;

  /// RSS feeds list
  final List<AppFeedTheme> feeds;

  /// Default [CategoryItem] constructor
  const CategoryItem({
    Key? key,
    required this.title,
    required this.feeds,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CategoryTitle(title: title),
          ...feeds
              .map<FeedItem>((AppFeedTheme feed) => FeedItem(feed: feed))
              .toList(),
        ],
      ),
    );
  }
}
