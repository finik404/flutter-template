import 'package:flutter/material.dart';
import 'package:tproject/util/options/icon.dart';

export 'package:tproject/util/constants/icons.dart';

class UIIcon extends StatelessWidget {
  const UIIcon(
    this.icon, {
    super.key,
    this.styles,
    this.size,
    this.color,
    this.weight,
  });

  final String icon;
  final TextStyle? styles;
  final double? size;
  final Color? color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    // Default styles
    TextStyle defaultStyles = styles ?? TIconOptions.styles;

    // Icon weight
    String? fontFamily;
    switch (weight ?? defaultStyles.fontWeight) {
      case FontWeight.w300:
        fontFamily = 'FontAwesomeLight';
        break;
      case FontWeight.bold:
        fontFamily = 'FontAwesomeBold';
        break;
      default:
        fontFamily = 'FontAwesomeRegular';
    }

    return Icon(
      IconData(int.parse('0x$icon'), fontFamily: fontFamily),
      size: size ?? defaultStyles.fontSize,
      color: color ?? defaultStyles.color,
    );
  }
}
