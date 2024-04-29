import 'package:flutter/material.dart';
import 'package:template/components/UI/Icon.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/icons.dart';

/*
  IconTextBtn Component ----------------
 */
class IconTextBtn extends StatelessWidget {
  // Variables ----------------
  final String label;
  final String? icon;
  final Function()? func;
  final String? link;
  final double? size;
  final Color? color;
  final double? textSize;
  final double? iconSize;
  final Color? textColor;
  final Color? iconColor;
  final bool? isBack;
  final bool? isRightSide;
  final double? widthBetween;

  // Props ----------------
  const IconTextBtn(
    this.label, {
    this.icon,
    this.func,
    this.link,
    this.isBack,
    this.isRightSide,
    this.size,
    this.color,
    this.textSize,
    this.iconSize,
    this.textColor,
    this.iconColor,
    this.widthBetween,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    Widget iconWidget = CIcon(
      icon ?? CIcons.plus,
      size: size ?? iconSize ?? 18,
      color: color ?? textColor,
    );

    return GestureDetector(
      onTap: func ??
          () {
            isBack == true
                ? Navigator.pop(context)
                : Navigator.pushNamed(context, link!);
          },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isRightSide != true) iconWidget,
          if (isRightSide != true) SizedBox(width: widthBetween ?? 12),
          CText(
            label,
            size: size ?? textSize ?? 16,
            color: color ?? textColor,
          ),
          if (isRightSide == true) SizedBox(width: widthBetween ?? 12),
          if (isRightSide == true) iconWidget,
        ],
      ),
    );
  }
}
