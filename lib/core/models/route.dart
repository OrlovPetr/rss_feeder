import 'package:flutter/material.dart';

/// Application routes list
enum Routes {
  /// Home
  home,
}

/// Extension for [Routes] with service methods
extension RoutesExt on Routes {
  /// Return [String] path name
  String get name => toString().replaceAll('Routes.', '');
}

/// Application routes
class AppRouter {
  Map<Routes, WidgetBuilder> _routes(BuildContext context) => {
        Routes.home: (BuildContext context) => const SizedBox.shrink(),
      };

  /// Return [Map] with [String] key and [WidgetBuilder] value routes list
  Map<String, WidgetBuilder> routes(BuildContext context) =>
      _routes(context).map<String, WidgetBuilder>(
        (Routes key, WidgetBuilder builder) => MapEntry(key.name, builder),
      );
}
