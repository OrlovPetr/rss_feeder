part of '../screens/feeds_screen.dart';

/// [FeedItem]
class FeedItem extends StatelessWidget {
  /// RSS feed item
  final AppFeedTheme feed;

  /// Item has bottom border
  final bool bottomBorder;

  /// Default [FeedItem] constructor
  const FeedItem({
    Key? key,
    required this.feed,
    this.bottomBorder = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: const BeveledRectangleBorder(),
          side: BorderSide.none,
        ),
        onPressed: () {},
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border(
              bottom: bottomBorder
                  ? const BorderSide(color: Colors.black12)
                  : BorderSide.none,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    feed.name,
                    style: Theme.of(context).textTheme.button,
                  ),
                ),
                if (feed.uri.isNotEmpty)
                  const Icon(
                    CupertinoIcons.right_chevron,
                    size: 24,
                    color: Colors.black26,
                  ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
