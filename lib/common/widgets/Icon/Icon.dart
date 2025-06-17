import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';

export 'package:font_awesome_flutter/font_awesome_flutter.dart';

class UIIcon extends StatelessWidget {
  const UIIcon(
    this.icon, {
    super.key,
    this.styles,
    this.size,
    this.color,
    this.weight,
  });

  final dynamic icon;
  final double? size;
  final TextStyle? styles;
  final Color? color;
  final FontWeight? weight;

  @override
  Widget build(BuildContext context) {
    // Default styles
    TextStyle defaultStyles = styles ?? TStyles.iconStyles;

    return Icon(
      icon,
      size: size ?? defaultStyles.fontSize,
      color: color ?? defaultStyles.color,
    );
  }
}
