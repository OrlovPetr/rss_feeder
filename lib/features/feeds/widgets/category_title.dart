part of '../screens/feeds_screen.dart';

/// [CategoryTitle] widget
class CategoryTitle extends StatelessWidget {
  /// Title
  final String title;

  /// Default [CategoryTitle] constructor
  const CategoryTitle({
    Key? key,
    required this.title,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10, top: 20),
      child: SizedBox(
        width: double.infinity,
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline5!.copyWith(
                fontWeight: FontWeight.w600,
              ),
        ),
      ),
    );
  }
}
