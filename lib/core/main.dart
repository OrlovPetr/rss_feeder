import 'package:flutter/material.dart';
import 'package:rss_feeder/core/enums/environment.dart';
import 'package:rss_feeder/core/models/container.dart';
import 'package:rss_feeder/core/widgets/main_widget.dart';

/// Run main application method
Future<void> appMain(AppEnvironment environment) async {
  final AppContainer container = AppContainer.init(environment: environment);
  runApp(AppMainWidget(container: container));
}
