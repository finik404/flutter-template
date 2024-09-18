import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/helpers/external.dart';
import 'package:tproject/util/options/text.dart';

class UITextLink extends StatelessWidget {
  const UITextLink(
    this.text, {
    super.key,
    this.screen,
    this.onTap,
    this.webLink,
    this.size,
    this.color,
    this.weight,
    this.styles,
    this.icon,
    this.iconColor,
    this.iconSize,
    this.iconWeight,
    this.spaceBetween = TTextOptions.linkSpaceBetween,
    this.isRightIcon = TTextOptions.linkIsRightIcon,
    this.radius = TTextOptions.linkClickRadius,
    this.padding = TTextOptions.linkClickPadding,
  });

  final String text;
  final Widget? screen;
  final Function()? onTap;
  final String? webLink;
  final TextStyle? styles;
  final String? icon;
  final double? size, iconSize, radius;
  final Color? color, iconColor;
  final FontWeight? weight, iconWeight;
  final double spaceBetween;
  final bool isRightIcon;
  final EdgeInsets padding;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    TextStyle defaultTextStyles = TTextOptions.linkStyles;
    TextStyle defaultIconStyles = TTextOptions.linkIconStyles;

    return UIClickArea(
      radius: radius,
      padding: padding,

      // onTap
      onTap: () {
        if (screen != null) Get.to(screen);
        if (onTap != null) onTap!();
        if (webLink != null) TExternal.launchUrl(webLink!);
      },

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
                color: iconColor ?? defaultIconStyles.color,
                size: iconSize ?? defaultIconStyles.fontSize,
                weight: iconWeight ?? defaultIconStyles.fontWeight,
              ),
            ),

          // Text
          UIText(
            text,
            color: color ?? defaultTextStyles.color,
            size: size ?? defaultTextStyles.fontSize,
            weight: weight ?? defaultTextStyles.fontWeight,
            styles: styles,
          ),

          // Right icon
          if (icon != null && isRightIcon)
            Container(
              margin: EdgeInsets.only(left: spaceBetween),
              child: UIIcon(
                icon!,
                color: iconColor ?? defaultIconStyles.color,
                size: iconSize ?? defaultIconStyles.fontSize,
                weight: iconWeight ?? defaultIconStyles.fontWeight,
              ),
            ),
        ],
      ),
    );
  }
}
