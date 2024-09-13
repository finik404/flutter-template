import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
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
    this.radiusClick = TOptions.checkBoxClickRadius,
    this.icon,
  });

  final bool value;
  final Function(bool)? onChange;
  final Color activeColor;
  final Color checkColor;
  final Color borderColor;
  final double size, radius, radiusClick;
  final EdgeInsets? paddingClick;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    return UIClickArea(
      // onTap
      onTap: onChange != null ? () => onChange!(!value) : null,

      // Click options
      padding: paddingClick ?? TOptions.checkBoxClickPadding,
      radius: radiusClick,

      // Container
      child: Container(
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
    );
  }
}
