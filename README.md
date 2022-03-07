# rss_feeder (in progress)

Investing.com RSS feeder App

## About

Example application.

Shows RSS feeds from [Investing.com](https://ru.investing.com/webmaster-tools/rss) source.

## General

App built with [Dart](https://dart.dev) v.2.14.0 and [Flutter](https://flutter.dev) v.2.5.3
for [Android](https://www.android.com) and [iOS](https://www.apple.com/ru/ios) platforms.

Uses community plugins and packages from [Pub](https://pub.dev).

More info in *pubspec* file.

## Functionality

1. Home Screen with list of categorized RSS feeds
   
   1.1. Screen with RSS feed

   1.2. Screen (webview) with chosen news item details
   
2. Favorites screen with list of favorite news
   (stores with [shared_preferences](https://pub.dev/packages/shared_preferences) in local device store)
   
   2.1. Screen (webview) with chosen news item details
   
3. Settings screen with next settings:
   
   3.1. App theme
   
   3.2. RSS feed refresh duration time (in minutes)
   
   3.3. Clear favorites main button
   
   3.4. Reset all app settings button
   
