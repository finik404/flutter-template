import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Disabled.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/options.dart';

class UIButton extends StatelessWidget {
  const UIButton(
    this.label,
    this.onTap, {
    super.key,
    this.styles,
    this.onLongTap,
    this.isDisabled,
    this.textStyles,
    this.textSize,
    this.textColor,
    this.textWeight,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.iconWeight,
    this.spaceBetween = WidgetsOptions.buttonSpaceBetween,
    this.isRightIcon = WidgetsOptions.buttonIsRightIcon,
    this.isFullWidth = WidgetsOptions.buttonIsFullWidth,
  });

  final String label;
  final Function() onTap;
  final Function()? onLongTap;
  final ButtonStyle? styles;
  final TextStyle? textStyles;
  final String? icon;
  final double? textSize, iconSize;
  final Color? textColor, iconColor;
  final FontWeight? textWeight, iconWeight;
  final double spaceBetween;
  final bool isRightIcon, isFullWidth;
  final bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyles = WidgetsOptions.buttonStyles;
    TextStyle iconStyles = WidgetsOptions.buttonIconStyles;

    Widget button = ElevatedButton(
      // onTap
      onPressed: onTap,
      onLongPress: onLongTap,

      // Styles
      style: styles ?? buttonStyles,

      // Content
      child: Row(
        mainAxisSize: isFullWidth ? MainAxisSize.max : MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Left icon
          if (icon != null && !isRightIcon)
            Container(
              margin: EdgeInsets.only(right: spaceBetween),
              child: UIIcon(
                icon!,
                color: iconColor ?? iconStyles.color,
                size: iconSize ?? iconStyles.fontSize,
                weight: iconWeight ?? iconStyles.fontWeight,
              ),
            ),

          // Text
          UIText(
            label,
            color: textColor ?? buttonStyles.textStyle?.resolve({})?.color,
            size: textSize ?? buttonStyles.textStyle?.resolve({})?.fontSize,
            weight: textWeight ?? buttonStyles.textStyle?.resolve({})?.fontWeight,
            styles: textStyles,
          ),

          // Right icon
          if (icon != null && isRightIcon)
            Container(
              margin: EdgeInsets.only(left: spaceBetween),
              child: UIIcon(
                icon!,
                color: iconColor ?? iconStyles.color,
                size: iconSize ?? iconStyles.fontSize,
                weight: iconWeight ?? iconStyles.fontWeight,
              ),
            ),
        ],
      ),
    );

    // isDisabled
    return isDisabled == true ? UIDisabled(isDisabled: isDisabled!, child: button) : button;
  }
}
