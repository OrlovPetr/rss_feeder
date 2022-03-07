part of '../screens/rss_feed_screen.dart';

/// [RSSFeedScreen] app bar
class RSSFeedAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// [RSSFeedState] state with RSS feed data
  final RSSFeedState state;

  /// Default [RSSFeedScreen] constructor
  const RSSFeedAppBar({
    Key? key,
    required this.state,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 90,
      backgroundColor: Colors.black54,
      title:
          Text(state.appRss?.title ?? RSSFeedScreenStrings.hasNoDataAboutFeed),
      leading: Padding(
        padding: const EdgeInsets.only(right: 8),
        child: TextButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Padding(
                padding: EdgeInsets.only(right: 2),
                child: Icon(
                  CupertinoIcons.left_chevron,
                  color: Colors.white,
                  size: 18,
                ),
              ),
              Text(
                UIKitStrings.appBarDefaultBackTitle,
                style: Theme.of(context).textTheme.button!.copyWith(
                      color: Colors.white,
                    ),
              )
            ],
          ),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size(double.infinity, kToolbarHeight);
}
