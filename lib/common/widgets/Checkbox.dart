import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/options/checkbox.dart';

class UICheckbox extends StatelessWidget {
  const UICheckbox(
    this.value, {
    super.key,
    this.onChange,
    this.activeColor = TColors.primary,
    this.checkColor = TColors.primary,
    this.borderColor = TColors.primary,
    this.radius = TCheckBoxOptions.radius,
    this.size = TCheckBoxOptions.size,
    this.paddingClick,
    this.radiusClick,
    this.icon,
    this.label,
    this.spaceBetween,
    this.labelStyles,
  });

  final bool value;
  final Function(bool)? onChange;
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final double size, radius;
  final double? radiusClick;
  final EdgeInsets? paddingClick;
  final String? icon, label;
  final TextStyle? labelStyles;
  final double? spaceBetween;

  @override
  Widget build(BuildContext context) {
    return UIClickArea(
      // onTap
      onTap: onChange != null ? () => onChange!(!value) : null,

      // Click options
      padding: paddingClick ?? (label != null ? TCheckBoxOptions.clickPaddingWithLabel : TCheckBoxOptions.clickPadding),
      radius: radiusClick ?? (label != null ? TCheckBoxOptions.clickRadiusWithLabel : TCheckBoxOptions.clickRadius),

      // Content
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CheckBox
          Container(
            width: TCheckBoxOptions.size,
            height: TCheckBoxOptions.size,
            decoration: TCheckBoxOptions.decoration(value),

            // Check icon
            child: Center(
              child: value
                  ? UIIcon(
                      icon ?? TCheckBoxOptions.icon,
                      color: TCheckBoxOptions.iconStyles.color,
                      weight: TCheckBoxOptions.iconStyles.fontWeight,
                      size: TCheckBoxOptions.size * TCheckBoxOptions.iconSize,
                    )
                  : null,
            ),
          ),

          if (label != null)
            Container(
              margin: const EdgeInsets.only(left: TCheckBoxOptions.spaceBetween),
              child: UIText(label!, styles: labelStyles ?? TCheckBoxOptions.labelStyles),
            )
        ],
      ),
    );
  }
}
