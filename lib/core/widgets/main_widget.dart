import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rss_feeder/core/models/container.dart';

/// Main application widget
class AppMainWidget extends StatelessWidget {
  /// Main application [AppContainer] entity
  final AppContainer container;

  /// Default [AppMainWidget] constructor
  const AppMainWidget({
    Key? key,
    required this.container,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [],
      child: MaterialApp(),
    );
  }
}
