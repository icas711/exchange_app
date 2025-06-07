import 'package:exchange_app/app/design/size_config.dart';
import 'package:flutter/material.dart';

/// A widget that displays a colored square item.
class ColoredItem extends StatelessWidget {
  const ColoredItem(this.color, {super.key});

  /// The color of the item to be displayed.
  final Color color;

  /// Creates a [ColoredItem] widget with the specified color.
  /// The widget is a square with a size of 56x56 pixels and has rounded corners.
  /// Used SizeConfig to ensure the size is responsive by height.
  /// Beacuse the text size is also responsive by height.
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: SizeConfig.h(56),
      width: SizeConfig.h(56),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(SizeConfig.w(18)),
        ),
      ),
    );
  }
}
