import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/util/constants/options.dart';

export 'package:tproject/util/constants/icons.dart';

class UIIconButton extends StatelessWidget {
  const UIIconButton(
    this.icon,
    this.onTap, {
    super.key,
    this.size,
    this.color,
    this.weight,
    this.onLongTap,
    this.padding,
    this.radius = WidgetsOptions.iconButtonRadius,
    this.borderRadius,
    this.splashColor,
  });

  final String icon;
  final Function() onTap;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  final Function()? onLongTap;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? splashColor;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return UIClickArea(
      // ClickArea options
      padding: padding ?? WidgetsOptions.iconButtonPadding,
      borderRadius: borderRadius,
      radius: radius,

      // onTap
      onTap: onTap,
      onLongTap: onLongTap,
      color: splashColor,

      // Icon
      child: IntrinsicWidth(
        child: UIIcon(
          icon,
          color: color,
          size: size,
          weight: weight,
        ),
      ),
    );
  }
}
