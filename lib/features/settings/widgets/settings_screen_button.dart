part of '../screens/settings_screen.dart';

/// Settings screen button
class SettingsScreenButton extends StatelessWidget {
  /// On pressed callback
  final VoidCallback? onPressed;

  /// Button icon data
  final IconData? iconData;

  /// Button title
  final String title;

  /// Button value
  final String? value;

  /// Default [SettingsScreenButton] constructor
  const SettingsScreenButton({
    Key? key,
    this.onPressed,
    this.iconData,
    required this.title,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        padding: EdgeInsets.zero,
        shape: const BeveledRectangleBorder(),
        side: BorderSide.none,
      ),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        child: Row(
          children: [
            if (iconData != null)
              Padding(
                padding: const EdgeInsets.only(right: 8),
                child: Icon(
                  iconData,
                  color: Colors.black26,
                  size: 24,
                ),
              ),
            Expanded(
              child: Text(
                title,
                style: Theme.of(context).textTheme.button!.copyWith(
                      fontWeight: FontWeight.w400,
                    ),
              ),
            ),
            if (value?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  value!,
                  style: Theme.of(context).textTheme.button!.copyWith(
                        fontWeight: FontWeight.w600,
                      ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
