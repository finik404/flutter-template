import 'package:flutter/material.dart';
import 'package:tproject/util/constants/options.dart';

export 'package:tproject/util/constants/icons.dart';

class UIIcon extends StatelessWidget {
  const UIIcon(
    this.code, {
    super.key,
    this.size,
    this.color,
    this.weight,
  });

  final String code;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    // Default styles
    IconThemeData defaultStyles = WidgetsOptions.iconStyles;

    // Icon weight
    double? customWeight;
    switch (weight) {
      case FontWeight.w300:
        customWeight = 300;
        break;
      case FontWeight.bold:
        customWeight = 700;
        break;
      default:
        customWeight = null;
    }

    return Icon(
      IconData(int.parse('0x$code'), fontFamily: 'FontAwesome'),
      size: size ?? defaultStyles.size,
      color: color ?? defaultStyles.color,
      weight: customWeight ?? defaultStyles.weight,
    );
  }
}
