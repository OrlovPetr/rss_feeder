import 'package:catcher/catcher.dart';
import 'package:flutter/material.dart';
import 'package:rss_feeder/core/enums/environment.dart';
import 'package:rss_feeder/core/models/container.dart';
import 'package:rss_feeder/core/widgets/main_widget.dart';
import 'package:rss_feeder/features/settings/models/settings.dart';
import 'package:rss_feeder/services/catcher_service.dart';

/// Run main application method
Future<void> appMain(AppEnvironment environment) async {
  WidgetsFlutterBinding.ensureInitialized();
  final AppContainer container =
      await AppContainer.init(environment: environment);
  final CatcherOptions options = CatcherService.options(container.appLogger);
  final AppSettings appSettings = await container.settingsRepository.get();

  Catcher(
    rootWidget: AppMainWidget(
      container: container,
      appSettings: appSettings,
    ),
    releaseConfig: options,
    debugConfig: options,
    // enableLogger: false,
  );
}
