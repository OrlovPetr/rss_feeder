part of '../screens/feed_webview.dart';

/// [FeedWebView] app bar
class FeedWebViewAppBar extends StatelessWidget implements PreferredSizeWidget {
  /// App bar title
  final String title;

  /// Default [FeedWebViewAppBar] constructor
  const FeedWebViewAppBar({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      titleSpacing: 0,
      centerTitle: true,
      leadingWidth: 90,
      backgroundColor: Colors.black54,
      title: Text(title),
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
                'Назад',
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
