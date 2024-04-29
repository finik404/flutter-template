import 'package:flutter/material.dart';
import 'package:template/components/UI/Icon.dart';
import 'package:template/constants/icons.dart';

/*
  IconBtn Component ----------------
 */
class IconBtn extends StatelessWidget {
  // Variables ----------------
  final String icon;
  final Function()? func;
  final String? link;
  final double? size;
  final Color? color;
  final bool? noSplash;
  final EdgeInsets? padding;
  final BorderRadius? borderRadius;
  final double? radius;

  // Props ----------------
  const IconBtn(
    this.icon, {
    this.func,
    this.link,
    this.size,
    this.color,
    this.noSplash,
    this.padding,
    this.borderRadius,
    this.radius,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    final noIcon = icon.isEmpty;

    if (padding != null) {
      return Material(
          child: InkWell(
              borderRadius: borderRadius ?? BorderRadius.circular(radius ?? 2),
              onTap: func ??
                  () {
                    Navigator.pushNamed(context, link!);
                  },
              child: Padding(
                padding: padding ?? EdgeInsets.zero,
                child: CIcon(noIcon ? CIcons.plus : icon,
                    color: color, size: size),
              )));
    }

    return IconButton(
      onPressed: func ?? () => Navigator.pushNamed(context, link!),
      padding: padding ?? EdgeInsets.zero,
      constraints: const BoxConstraints(),
      style: const ButtonStyle(
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      highlightColor: noSplash == true ? Colors.transparent : null,
      icon: CIcon(noIcon ? CIcons.plus : icon, color: color, size: size),
    );
  }
}
