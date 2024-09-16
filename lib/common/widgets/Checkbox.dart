import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/options.dart';

class UICheckbox extends StatelessWidget {
  const UICheckbox(
    this.value, {
    super.key,
    this.onChange,
    this.activeColor = TColors.primary,
    this.checkColor = TColors.primary,
    this.borderColor = TColors.primary,
    this.radius = TOptions.checkBoxRadius,
    this.size = TOptions.checkBoxSize,
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
      padding: paddingClick ?? (label != null ? TOptions.checkBoxClickPaddingWithLabel : TOptions.checkBoxClickPadding),
      radius: radiusClick ?? (label != null ? TOptions.checkBoxClickRadiusWithLabel : TOptions.checkBoxClickRadius),

      // Content
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          // CheckBox
          Container(
            width: TOptions.checkBoxSize,
            height: TOptions.checkBoxSize,
            decoration: TOptions.checkBoxDecoration(value),

            // Check icon
            child: Center(
              child: value
                  ? UIIcon(
                      icon ?? TOptions.checkBoxIcon,
                      color: TOptions.checkBoxIconStyles.color,
                      weight: TOptions.checkBoxIconStyles.fontWeight,
                      size: TOptions.checkBoxSize * TOptions.checkBoxIconSize,
                    )
                  : null,
            ),
          ),

          if (label != null)
            Container(
              margin: const EdgeInsets.only(left: TOptions.checkBoxSpaceBetween),
              child: UIText(label!, styles: labelStyles ?? TOptions.checkBoxLabelStyles),
            )
        ],
      ),
    );
  }
}
