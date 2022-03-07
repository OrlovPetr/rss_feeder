part of '../ui_kit.dart';

/// Application picker in Cupertino style
class CupertinoStylePicker extends StatelessWidget {
  /// Initial chosen item index
  final int initialItem;

  /// The uniform height of all children.
  ///
  /// All children will be given the BoxConstraints to match this exact height. Must not be null and must be positive.
  final double itemExtent;

  /// On selected item changed callback function
  final ValueChanged<int>? onSelectedItemChanged;

  /// [List] of children picker items [Widget]
  final List<Widget> children;

  /// Default [CupertinoStylePicker] constructor
  const CupertinoStylePicker({
    Key? key,
    this.initialItem = 0,
    required this.itemExtent,
    this.onSelectedItemChanged,
    this.children = const [],
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: CupertinoPicker(
        scrollController: FixedExtentScrollController(initialItem: initialItem),
        itemExtent: itemExtent,
        onSelectedItemChanged: onSelectedItemChanged,
        children: children,
        useMagnifier: true,
        backgroundColor: Colors.transparent,
      ),
    );
  }
}
