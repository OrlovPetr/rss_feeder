import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/models/container.dart';
import 'package:rss_feeder/core/models/route.dart';

/// Main application widget
class AppMainWidget extends StatelessWidget {
  /// Main application [AppContainer] entity
  final AppContainer container;

  final AppRouter _appRouter;

  /// Default [AppMainWidget] constructor
  AppMainWidget({
    Key? key,
    required this.container,
  })  : _appRouter = AppRouter(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(
        initialRoute: Routes.home.name,
        routes: _appRouter.routes(context),
      ),
    );
  }
}
