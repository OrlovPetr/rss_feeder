part of '../ui_kit.dart';

/// Application loader widget
class Loader extends StatelessWidget {
  /// Default [Loader] constructor
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const CircularProgressIndicator(color: Colors.black54);
  }
}
