import 'package:flutter/material.dart';
import 'package:template/components/UI/Disabled.dart';
import 'package:template/components/UI/Icon.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/colors.dart';

/*
  Btn Component ----------------
 */
class Btn extends StatelessWidget {
  // Variables ----------------
  final String label;
  final Function()? func;
  final String? icon;
  final double? width;
  final Color? bg;
  final Color? textColor;
  final double? textSize;
  final FontWeight? textWeight;
  final TextStyle? textStyles;
  final double? iconSize;
  final Color? iconColor;
  final bool? isRightSideIcon;
  final double? widthBetween;
  final bool? widthBetweenAuto;
  final EdgeInsets? padding;
  final double? radius;
  final BorderRadius? borderRadiusFull;
  final BorderSide? border;
  final Color? borderColor;
  final Color? shadowColor;
  final double? elevation;
  final bool? isDisabled;
  final Widget? image;
  final bool? noFullWidth;

  // Props ----------------
  const Btn(
    this.label,
    this.func, {
    this.icon,
    this.width,
    this.bg,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.textStyles,
    this.iconSize,
    this.iconColor,
    this.isRightSideIcon,
    this.widthBetween,
    this.widthBetweenAuto,
    this.padding,
    this.radius,
    this.borderRadiusFull,
    this.border,
    this.borderColor,
    this.shadowColor,
    this.elevation,
    this.isDisabled,
    this.image,
    this.noFullWidth,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    bool isWidthBetweenAuto = widthBetweenAuto == true;
    bool isIconRightSide = icon != null && isRightSideIcon == true;

    Widget iconWidget = icon != null
        ? Container(
            margin: EdgeInsets.only(
                left: isWidthBetweenAuto
                    ? 0
                    : isIconRightSide
                        ? widthBetween ?? 8
                        : 0,
                right: isWidthBetweenAuto
                    ? 0
                    : isRightSideIcon == false || isRightSideIcon == null
                        ? widthBetween ?? 8
                        : 0),
            child: CIcon(icon!,
                size: iconSize ?? 14,
                color: iconColor ?? AppColors.black),
          )
        : Container();

    Widget button = ElevatedButton(
      onPressed: func,
      style: ElevatedButton.styleFrom(
          padding: padding ??
              const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
          backgroundColor: bg ?? AppColors.orange,
          shadowColor: shadowColor ?? Colors.transparent,
          elevation: elevation ?? 0,
          shape: RoundedRectangleBorder(
            borderRadius:
                borderRadiusFull ?? BorderRadius.circular(radius ?? 6),
            side: borderColor != null
                ? BorderSide(color: borderColor!)
                : border ?? const BorderSide(color: Colors.transparent),
          )),
      child: Row(
          mainAxisAlignment: isWidthBetweenAuto
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            // Если есть иконка
            if (!isIconRightSide) iconWidget,
            CText(
              label,
              color: textColor ?? AppColors.black,
              size: textSize ?? 16,
              weight: textWeight ?? FontWeight.normal,
              style: textStyles,
            ),
            if (isIconRightSide) iconWidget,
          ]),
    );

    noFullWidth == true ? button = IntrinsicWidth(child: button) : null;

    return isDisabled == true
        ? Disabled(isDisabled: isDisabled!, child: button)
        : button;
  }
}
