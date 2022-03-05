part of 'home_widgets.dart';

/// Home screen bottom navigation bar
class AppBottomNavigationBar extends StatelessWidget {
  /// Init [HomeTab] state
  final HomeTab initTab;

  /// Default [AppBottomNavigationBar] constructor
  const AppBottomNavigationBar({
    Key? key,
    required this.initTab,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: initTab.index,
      backgroundColor: Colors.blue,
      selectedItemColor: Colors.orangeAccent,
      unselectedItemColor: Colors.white,
      items: <BottomNavigationBarItem>[
        _item(CupertinoIcons.home, 'Новости'),
        _item(CupertinoIcons.star_fill, 'Избранное'),
        _item(CupertinoIcons.settings, 'Настройки'),
      ],
      onTap: (int index) {
        final HomeTabsNavigatorCubit tabNavigator =
            context.read<HomeTabsNavigatorCubit>();
        tabNavigator.state = HomeTabExt.byIndex(index);
      },
    );
  }

  BottomNavigationBarItem _item(
    IconData iconData,
    String label,
  ) =>
      BottomNavigationBarItem(
        icon: Icon(
          iconData,
          size: 24,
        ),
        label: label,
      );
}
