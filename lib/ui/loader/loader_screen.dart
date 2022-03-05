part of '../ui_kit.dart';

/// Application loader screen
class LoaderScreen extends StatelessWidget {
  /// Default [LoaderScreen] constructor
  const LoaderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: Colors.black54,
      ),
    );
  }
}
