part of '../screens/settings_screen.dart';

/// Settings screen app theme picker
class SettingsAppThemePicker extends StatelessWidget {
  /// On selected item changed callback function
  final ValueChanged<int>? onSelectedItemChanged;

  /// Default [SettingsAppThemePicker] constructor
  const SettingsAppThemePicker({
    Key? key,
    this.onSelectedItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsState settingsState = context.read<SettingsBloc>().state;
    final List<String> labels = AppThemeStyleExt.labels;

    return CupertinoStylePicker(
      itemExtent: 30,
      initialItem: settingsState.appSettings.appThemeStyle.index,
      onSelectedItemChanged: onSelectedItemChanged,
      children: List.generate(
        labels.length,
        (index) => SizedBox(
          height: 30,
          child: Center(
            child: Text(
              labels[index],
              style: Theme.of(context).textTheme.bodyText1!.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
            ),
          ),
        ),
      ),
    );
  }
}
