part of '../screens/favorites_screen.dart';

/// [FavoritesScreen] item widget
class FavoritesItem extends StatelessWidget {
  /// Favorites screen item data
  final RSSFeedItem item;

  /// [FavoritesItem] position in list
  final int index;

  /// [FavoritesItem] widgets [List] length
  final int length;

  /// Default [FavoritesItem] constructor
  const FavoritesItem({
    Key? key,
    required this.item,
    required this.index,
    required this.length,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: _isFirst ? 20 : 0,
        bottom: _isLast ? 20 : 0,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(border: Border(bottom: _borderSide)),
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
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                    if (item.url?.isNotEmpty ?? false)
                      TextButton(
                        style: TextButton.styleFrom(
                          padding: EdgeInsets.zero,
                          shape: const BeveledRectangleBorder(),
                          side: BorderSide.none,
                        ),
                        child: Text(
                          FavoritesScreenStrings.favoritesItemMore,
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
                  icon: const Icon(
                    CupertinoIcons.star_fill,
                    size: 24,
                    color: Colors.orangeAccent,
                  ),
                  onPressed: () {
                    context
                        .read<FavoritesBloc>()
                        .add(FavoritesRemove(item: item));
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  BorderSide get _borderSide => !_isLast
      ? const BorderSide(
          color: Colors.black12,
        )
      : BorderSide.none;

  bool get _isFirst => index == 0;

  bool get _isLast => index == length - 1;
}
