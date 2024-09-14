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
    this.icon,
    this.customIcon,
    this.iconStyles,
    this.spaceBetween = TOptions.buttonSpaceBetween,
    this.isRightIcon = TOptions.buttonIsRightIcon,
    this.isFullWidth = TOptions.buttonIsFullWidth,
  });

  final String label;
  final Function() onTap;
  final Function()? onLongTap;
  final ButtonStyle? styles;
  final TextStyle? textStyles, iconStyles;
  final String? icon;
  final Widget? customIcon;
  final double spaceBetween;
  final bool isRightIcon, isFullWidth;
  final bool? isDisabled;

  @override
  Widget build(BuildContext context) {
    ButtonStyle buttonStyles = TOptions.buttonStyles;
    TextStyle customIconStyles = TOptions.buttonIconStyles;

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
              child: customIcon ?? UIIcon(
                icon!,
                color: customIconStyles.color,
                size: customIconStyles.fontSize,
                weight: customIconStyles.fontWeight,
              ),
            ),

          // Text
          UIText(
            label,
            color: textStyles?.color ?? buttonStyles.textStyle?.resolve({})?.color,
            size: textStyles?.fontSize ?? buttonStyles.textStyle?.resolve({})?.fontSize,
            weight: textStyles?.fontWeight ?? buttonStyles.textStyle?.resolve({})?.fontWeight,
            styles: textStyles,
          ),

          // Right icon
          if (icon != null && isRightIcon)
            Container(
              margin: EdgeInsets.only(left: spaceBetween),
              child: customIcon ?? UIIcon(
                icon!,
                color: customIconStyles.color,
                size: customIconStyles.fontSize,
                weight: customIconStyles.fontWeight,
              ),
            ),
        ],
      ),
    );

    // isDisabled
    return isDisabled == true ? UIDisabled(isDisabled: isDisabled!, child: button) : button;
  }
}
