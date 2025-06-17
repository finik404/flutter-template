import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Image.dart';
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
    this.isAssets = true,
  });

  final dynamic icon;
  final double? size;
  final TextStyle? styles;
  final Color? color;
  final FontWeight? weight;
  final bool isAssets;

  @override
  Widget build(BuildContext context) {
    // Default styles
    TextStyle defaultStyles = styles ?? TStyles.iconStyles;

    if(icon.runtimeType == String) {
      return UIImage(icon, width: size ?? 20, isAssets: isAssets, radius: 0);
    }

    return Icon(
      icon,
      size: size ?? defaultStyles.fontSize,
      color: color ?? defaultStyles.color,
    );
  }
}
