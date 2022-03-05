import 'package:catcher/catcher.dart';
import 'package:rss_feeder/core/enums/environment.dart';
import 'package:rss_feeder/core/models/container.dart';
import 'package:rss_feeder/core/widgets/main_widget.dart';
import 'package:rss_feeder/services/catcher_service.dart';

/// Run main application method
Future<void> appMain(AppEnvironment environment) async {
  final AppContainer container = AppContainer.init(environment: environment);
  final CatcherOptions options = CatcherService.options(container.appLogger);
  Catcher(
    rootWidget: AppMainWidget(container: container),
    releaseConfig: options,
    debugConfig: options,
  );
}
