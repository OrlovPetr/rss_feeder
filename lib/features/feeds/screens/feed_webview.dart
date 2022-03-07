import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rss_feeder/ui/ui_kit.dart';
import 'package:webview_flutter/webview_flutter.dart';

part '../widgets/feed_webview_app_bar.dart';

/// Application RSS feed details webview
class FeedWebView extends StatelessWidget {
  /// News item full url
  final String url;

  /// News item title
  final String title;

  /// Default [FeedWebView] constructor
  const FeedWebView({
    Key? key,
    required this.url,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: FeedWebViewAppBar(title: title),
      body: WebView(initialUrl: url),
    );
  }
}
