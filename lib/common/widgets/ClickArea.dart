import 'package:flutter/material.dart';

class ClickArea extends StatelessWidget {
  const ClickArea({
    super.key,
    required this.onTap,
    this.onLongPress,
    required this.child,
    this.borderRadius,
    this.radius,
    this.color,
    this.padding,
    this.isTextPadding,
    this.noMaterial,
  });

  final Function() onTap;
  final Widget child;
  final BorderRadius? borderRadius;
  final double? radius;
  final Color? color;
  final EdgeInsets? padding;
  final bool? isTextPadding;
  final bool? noMaterial;
  final Function()? onLongPress;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 10),
      splashColor: color ?? context.theme.primary.withOpacity(0.1),
      highlightColor: color ?? context.theme.primary.withOpacity(0.1),
      onTap: onTap,
      onLongPress: onLongPress,
      child: Padding(
        padding: isTextPadding == true ? const EdgeInsets.symmetric(horizontal: 3) : padding ?? const EdgeInsets.all(0),
        child: child,
      ),
    );
  }
}
