part of '../screens/settings_screen.dart';

/// Settings screen refresh duration picker
class SettingsRefreshDurationPicker extends StatelessWidget {
  /// On selected item changed callback function
  final ValueChanged<int>? onSelectedItemChanged;

  /// Default [SettingsRefreshDurationPicker] constructor
  const SettingsRefreshDurationPicker({
    Key? key,
    this.onSelectedItemChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsState settingsState = context.read<SettingsBloc>().state;
    final int initialItem = SettingsResources.refreshDurationOptions
        .getIndex(settingsState.appSettings.refreshDuration);

    return CupertinoStylePicker(
      itemExtent: 30,
      initialItem: initialItem,
      onSelectedItemChanged: onSelectedItemChanged,
      children: List.generate(
        SettingsResources.refreshDurationOptions.length,
        (index) => SizedBox(
          height: 30,
          child: Center(
            child: Text(
              '${(SettingsResources.refreshDurationOptions[index] / 60).toStringAsFixed(0)} минут',
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
