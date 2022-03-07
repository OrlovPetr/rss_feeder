part of '../ui_kit.dart';

/// Application bottom sheet template with fixed height
class FixedBottomSheet extends StatelessWidget {
  /// [FixedBottomSheet] height
  final double bottomSheetHeight;

  /// Cancel button label text
  final String cancelLabel;

  /// Accept button label text
  final String acceptLabel;

  /// On cancel button pressed callback
  final VoidCallback? onCancel;

  /// On accept button pressed callback
  final VoidCallback? onAccept;

  /// Bottom sheet [Widget] content
  final Widget content;

  /// Default [FixedBottomSheet] constructor
  const FixedBottomSheet({
    Key? key,
    this.bottomSheetHeight = 250,
    this.cancelLabel = 'Назад',
    this.acceptLabel = 'Готово',
    this.onCancel,
    this.onAccept,
    required this.content,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final SettingsState settingsState = context.read<SettingsBloc>().state;
    final ThemeData _currentData = ThemeService.currentTheme(
      context,
      settingsState.appSettings.appThemeStyle,
    );

    return ConstrainedBox(
      constraints: BoxConstraints(
        maxHeight: bottomSheetHeight,
        minHeight: bottomSheetHeight,
      ),
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          ),
          color: _backgroundColor(_currentData),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 10,
          ),
          child: Column(
            // mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  TextButton(
                    onPressed: onCancel ??
                        () {
                          Navigator.of(context).pop();
                        },
                    child: Text(
                      UIKitStrings.fixedBottomSheetCancelDefaultLabel,
                      style: Theme.of(context)
                          .textTheme
                          .button!
                          .copyWith(color: Colors.red),
                    ),
                  ),
                  const Expanded(
                    child: SizedBox.shrink(),
                  ),
                  TextButton(
                    onPressed: onAccept,
                    child: Text(
                      UIKitStrings.fixedBottomSheetAcceptDefaultLabel,
                      style: Theme.of(context).textTheme.button!.copyWith(
                            color: _acceptLabelColor(_currentData),
                          ),
                    ),
                  ),
                ],
              ),
              content,
            ],
          ),
        ),
      ),
    );
  }

  Color _backgroundColor(ThemeData themeData) {
    if (themeData == ThemeData.dark()) {
      return Colors.black87;
    } else {
      return Colors.white;
    }
  }

  Color _acceptLabelColor(ThemeData themeData) {
    if (themeData == ThemeData.dark()) {
      return Colors.white;
    } else {
      return Colors.blueAccent;
    }
  }
}
