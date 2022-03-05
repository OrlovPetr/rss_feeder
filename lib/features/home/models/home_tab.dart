/// Application [HomeTab] tabs on main screens
enum HomeTab {
  /// Home tab
  home,

  /// Favorites tab
  favorites,

  /// Settings tab
  settings,
}

/// Extension on [HomeTab] with service methods
extension HomeTabExt on HomeTab {
  /// Get [HomeTab] by index
  static HomeTab byIndex(int index) {
    final int length = HomeTab.values.length;

    if (index >= length) {
      return HomeTab.values.last;
    }

    if (index < 0) {
      return HomeTab.values.first;
    }

    return HomeTab.values[index];
  }
}
