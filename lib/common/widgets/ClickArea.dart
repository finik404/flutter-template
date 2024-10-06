import 'package:flutter/material.dart';
import 'package:tproject/util/options/clickarea.dart';

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
    this.hasMaterial = false,
  });

  final Function()? onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? color;
  final EdgeInsets? padding;
  final Function()? onLongTap;
  final bool hasMaterial;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    Widget clickItem = InkWell(
      onTap: onTap,
      onLongPress: onLongTap,
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? TClickAreaOptions.radius),
      splashColor: color ?? TClickAreaOptions.color,
      highlightColor: color ?? TClickAreaOptions.color,
      child: Padding(
        padding: padding ?? TClickAreaOptions.padding,
        child: child,
      ),
    );

    return hasMaterial ? Material(color: Colors.transparent, child: clickItem) : clickItem;
  }
}
