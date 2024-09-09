import 'package:flutter/material.dart';
import 'package:talktime/core/widgets/UI/ClickArea.dart';
import 'package:talktime/core/widgets/UI/Icon/_index.dart';

/*
  IconBtn Component ----------------
 */
class IconBtn extends StatelessWidget {
  // Variables ----------------
  final String icon;
  final Function()? onTap;
  final Widget? screen;
  final double? size;
  final Color? color;
  final bool? noSplash;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? radius;
  final Alignment? align;
  final Color? splashColor;
  final double? width;
  final double? height;
  final EdgeInsets? margin;

  // Props ----------------
  const IconBtn(
    this.icon, {
    super.key,
    this.onTap,
    this.screen,
    this.size,
    this.color,
    this.noSplash,
    this.padding,
    this.borderRadius,
    this.radius,
    this.align,
    this.splashColor,
    this.width,
    this.height,
    this.margin,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    final noIcon = icon.isEmpty;

    return Container(
      width: width ?? 20,
      height: height ?? 20,
      margin: margin,
      child: ClickArea(
        padding: padding ?? const EdgeInsets.all(0),
        borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 6),
        onTap: onTap != null ? () => onTap!() : () => Navigator.push(context, MaterialPageRoute(builder: (context) => screen!)),
        color: splashColor,
        child: Center(
            child: CIcon(
          noIcon ? '2b' : icon,
          color: color,
          size: size,
        )),
      ),
    );
  }
}
