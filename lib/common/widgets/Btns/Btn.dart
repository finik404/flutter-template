import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Disabled.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';

class UIButton extends StatelessWidget {
  const UIButton(
    this.label,
    this.onTap, {
    super.key,
    this.icon,
    this.iconSize,
    this.iconColor,
    this.isDisabled,
    this.noFullWidth,
    this.iconWeight,
    this.onLongTap,
  });

  final String label;
  final Function() onTap;
  final Function()? onLongTap;
  final TextStyle? textStyles;
  final String? icon;
  final double? textSize, iconSize;
  final Color? textColor, iconColor;
  final FontWeight? weight, iconWeight;
  final double spaceBetween;
  final bool isRightIcon;
  final bool? isDisabled;
  final bool? noFullWidth;

  @override
  Widget build(BuildContext context) {
    ButtonStyle defaultStyles = Theme.of(context).elevatedButtonTheme.style!;

    Widget button = Container(
      decoration: BoxDecoration(borderRadius: Styles.br),
      child: ElevatedButton(
        // onTap
        onPressed: onTap,
        onLongPress: onLongTap,

        // Styles
        style: defaultStyles,

        // Content
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            // Left icon
            if (icon != null && !isRightIcon)
              Container(
                margin: EdgeInsets.only(right: spaceBetween),
                child: UIIcon(
                  icon!,
                  color: iconColor,
                  size: iconSize,
                  weight: iconWeight,
                ),
              ),

            // Text
            UIText(
              label,
              color: defaultStyles.textStyle.color,
              size: defaultStyles.textStyle.size,
              weight: defaultStyles.textStyle.weight,
              styles: textStyles,
            ),

            // Right icon
            if (icon != null && isRightIcon)
              Container(
                margin: EdgeInsets.only(left: spaceBetween),
                child: UIIcon(
                  icon!,
                  color: iconColor,
                  size: iconSize,
                  weight: iconWeight,
                ),
              ),
          ],
        ),
      ),
    );

    noFullWidth == true ? button = IntrinsicWidth(child: button) : null;

    // isDisabled
    return isDisabled == true ? UIDisabled(isDisabled: isDisabled!, child: button) : button;
  }
}
