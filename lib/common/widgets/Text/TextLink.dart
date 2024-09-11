import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:tproject/util/helpers/helper.dart';

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
    this.spaceBetween = WidgetsOptions.textLinkSpaceBetween,
    this.isRightIcon = WidgetsOptions.textLinkIsRightIcon,
  });

  final String text;
  final Widget? screen;
  final Function()? onTap;
  final String? webLink;
  final TextStyle? styles;
  final String? icon;
  final double? size, iconSize;
  final Color? color, iconColor;
  final FontWeight? weight, iconWeight;
  final double spaceBetween;
  final bool isRightIcon;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return ClickArea(
      borderRadius: BorderRadius.circular(5),
      padding: const EdgeInsets.symmetric(horizontal: 5),

      // onTap
      onTap: () {
        if (screen != null) Get.to(screen);
        if (onTap != null) onTap!();
        if (webLink != null) THelperFunctions.launchUrl(webLink!);
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
                color: iconColor,
                size: iconSize,
                weight: iconWeight,
              ),
            ),

          // Text
          UIText(text, color: color, size: size, weight: weight, styles: styles),

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
    );
  }
}
