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
    String? fontFamily;
    switch (weight ?? defaultStyles.weight) {
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
      IconData(int.parse('0x$code'), fontFamily: fontFamily),
      size: size ?? defaultStyles.size,
      color: color ?? defaultStyles.color,
    );
  }
}
