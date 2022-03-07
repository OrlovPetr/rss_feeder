part of '../screens/rss_feed_screen.dart';

/// [RSSFeedScreen] item
class RSSFeedItemWidget extends StatelessWidget {
  /// [RSSFeedItemWidget] parsed item
  final RSSFeedItem item;

  /// [RSSFeedItemWidget] position in list
  final int index;

  /// [RSSFeedItemWidget] widgets [List] length
  final int length;

  /// Default [RSSFeedItemWidget] constructor
  const RSSFeedItemWidget({
    Key? key,
    required this.item,
    required this.index,
    required this.length,
  }) : super(key: key);

  BorderSide _borderSide(ThemeData themeData) => !_isLast
      ? BorderSide(color: ThemeService.itemBorderColor(themeData))
      : BorderSide.none;

  bool get _isFirst => index == 0;

  bool get _isLast => index == length - 1;

  String get _date {
    final String date =
        '${item.date!.day}.${item.date!.month}.${item.date!.year} ${item.date!.hour}:${item.date!.minute}';

    return item.date != null
        ? RSSFeedScreenStrings.rssFeedItemWidgetDate.replaceAll('#TAG', date)
        : RSSFeedScreenStrings.rssFeedItemWidgetDateEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final FavoritesBloc favoritesBloc = context.watch<FavoritesBloc>();
    final SettingsState settingsState = context.read<SettingsBloc>().state;
    final ThemeData themeData = ThemeService.currentThemeByContext(
        context, settingsState.appSettings.appThemeStyle);

    return Padding(
      padding: EdgeInsets.only(
        top: _isFirst ? 20 : 0,
        bottom: _isLast ? 20 : 0,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          border: Border(
            bottom: _borderSide(themeData),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (item.title?.isNotEmpty ?? false)
                      Text(
                        item.title!,
                        style: Theme.of(context).textTheme.subtitle1!.copyWith(
                              fontWeight: FontWeight.w600,
                            ),
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (item.date != null)
                      Text(
                        _date,
                        style: Theme.of(context).textTheme.caption,
                        textAlign: TextAlign.left,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (item.author?.isNotEmpty ?? false)
                      Padding(
                        padding: const EdgeInsets.only(top: 4),
                        child: Text(
                          RSSFeedScreenStrings.rssFeedItemWidgetAuthor
                              .replaceAll('#TAG', item.author!),
                          style: Theme.of(context).textTheme.caption,
                          textAlign: TextAlign.left,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    if (item.url?.isNotEmpty ?? false)
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const BeveledRectangleBorder(),
                          side: BorderSide.none,
                        ),
                        child: Text(
                          RSSFeedScreenStrings.rssFeedItemWidgetMore,
                          style: Theme.of(context).textTheme.button!.copyWith(
                                decoration: TextDecoration.underline,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) => FeedWebView(
                                url: item.url!,
                                title: item.title!,
                              ),
                            ),
                          );
                        },
                      ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: IconButton(
                  icon: Icon(
                    favoritesBloc.state.inFavorites(item)
                        ? CupertinoIcons.star_fill
                        : CupertinoIcons.star,
                    size: 24,
                    color: Colors.orangeAccent,
                  ),
                  onPressed: () {
                    context.read<FavoritesBloc>().add(FavoritesAdd(item: item));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
