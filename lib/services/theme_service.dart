import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';

/// Application [Theme] service
class ThemeService {
  /// Get current [ThemeData] instance
  static ThemeData currentTheme(AppThemeStyle appTheme) {
    switch (appTheme) {
      case AppThemeStyle.system:
        {
          final Brightness brightness =
              SchedulerBinding.instance!.window.platformBrightness;
          bool isDarkMode = brightness == Brightness.dark;

          return isDarkMode ? ThemeData.dark() : ThemeData.light();
        }
      case AppThemeStyle.dark:
        return ThemeData.dark();
      case AppThemeStyle.light:
      default:
        return ThemeData.light();
    }
  }

  /// Get current [ThemeData] instance from context
  static ThemeData currentThemeByContext(
    BuildContext context,
    AppThemeStyle appTheme,
  ) {
    switch (appTheme) {
      case AppThemeStyle.system:
        {
          final Brightness brightness =
              MediaQuery.of(context).platformBrightness;
          bool isDarkMode = brightness == Brightness.dark;

          return isDarkMode ? ThemeData.dark() : ThemeData.light();
        }
      case AppThemeStyle.dark:
        return ThemeData.dark();
      case AppThemeStyle.light:
      default:
        return ThemeData.light();
    }
  }

  /// Check [ThemeData] and return [Color] for refresh indicator
  static Color refreshIndicatorColor(ThemeData themeData) {
    if (themeData == ThemeData.dark()) {
      return Colors.orangeAccent;
    } else {
      return Colors.black54;
    }
  }

  /// Check [ThemeData] and return [Color] for items border
  static Color itemBorderColor(ThemeData themeData) {
    if (themeData == ThemeData.dark()) {
      return Colors.white54;
    } else {
      return Colors.black12;
    }
  }

  /// Check [ThemeData] and return [Color] for items border
  static Color itemArrowColor(ThemeData themeData) {
    if (themeData == ThemeData.dark()) {
      return Colors.white30;
    } else {
      return Colors.black26;
    }
  }
}
