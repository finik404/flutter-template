import 'package:flutter/material.dart';
import 'package:tproject/util/constants/options.dart';

class UIClickArea extends StatelessWidget {
  const UIClickArea({
    super.key,
    this.onTap,
    required this.child,
    this.onLongTap,
    this.borderRadius,
    this.radius,
    this.color,
    this.padding,
  });

  final Function()? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? color;
  final EdgeInsets? padding;
  final Function()? onLongTap;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      onLongPress: onLongTap,
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? WidgetsOptions.clickAreaRadius),
      splashColor: color ?? WidgetsOptions.clickAreaColor,
      highlightColor: color ?? WidgetsOptions.clickAreaColor,
      child: Padding(
        padding: padding ?? WidgetsOptions.clickAreaPadding,
        child: child,
      ),
    );
  }
}
