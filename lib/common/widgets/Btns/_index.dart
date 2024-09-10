import 'package:flutter/material.dart';
import 'package:talktime/config/constants/colors.dart';
import 'package:talktime/config/constants/styles.dart';
import 'package:talktime/core/extensions/theme.dart';
import 'package:talktime/core/widgets/UI/Disabled.dart';
import 'package:talktime/core/widgets/UI/Icon/_index.dart';
import 'package:talktime/core/widgets/UI/Text/_index.dart';

/*
  Btn Component ----------------
 */
class Btn extends StatelessWidget {
  // Variables ----------------
  final String label;
  final Function()? onTap;
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
  final FontWeight? iconWeight;
  final Widget? iconWidget;

  // Props ----------------
  const Btn(
    this.label,
    this.onTap, {
    super.key,
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
    this.iconWeight,
    this.iconWidget,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    bool isWidthBetweenAuto = widthBetweenAuto == true;
    bool isIconRightSide = icon != null && isRightSideIcon == true;

    Widget iconChild = icon != null
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
            child: CIcon(icon!, size: iconSize ?? 14, color: iconColor ?? AppColors.black),
          )
        : Container();

    Widget button = Container(
        decoration: BoxDecoration(borderRadius: Styles.br),
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
              padding: padding ?? const EdgeInsets.all(16),
              backgroundColor: bg ?? AppColors.blue,
              shadowColor: shadowColor ?? Colors.transparent,
              elevation: elevation ?? 0,
              shape: RoundedRectangleBorder(
                borderRadius: borderRadiusFull ?? BorderRadius.circular(radius ?? 10),
                side: borderColor != null ? BorderSide(color: borderColor!) : border ?? const BorderSide(color: Colors.transparent),
              )),
          child: Row(mainAxisAlignment: isWidthBetweenAuto ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center, children: [
            // Если есть иконка
            if (!isIconRightSide) iconWidget ?? iconChild,
            CText(
              label,
              color: textColor ?? AppColors.white,
              size: textSize ?? 16,
              weight: textWeight ?? FontWeight.normal,
              style: textStyles,
            ),
            if (isIconRightSide) iconWidget ?? iconChild,
          ]),
        ));

    noFullWidth == true ? button = IntrinsicWidth(child: button) : null;

    return isDisabled == true ? Disabled(isDisabled: isDisabled!, child: button) : button;
  }
}
