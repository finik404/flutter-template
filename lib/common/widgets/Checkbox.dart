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
    this.activeColor = AppColors.primary,
    this.checkColor = AppColors.primary,
    this.borderColor = AppColors.primary,
    this.radius = WidgetsOptions.checkBoxRadius,
    this.size = WidgetsOptions.checkBoxSize,
    this.paddingClick,
    this.radiusClick = WidgetsOptions.checkBoxClickRadius,
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
      padding: paddingClick ?? WidgetsOptions.checkBoxClickPadding,
      radius: radiusClick,

      // Container
      child: Container(
        width: WidgetsOptions.checkBoxSize,
        height: WidgetsOptions.checkBoxSize,
        decoration: WidgetsOptions.checkBoxDecoration(value),

        // Check icon
        child: Center(
          child: value
              ? UIIcon(
                  icon ?? WidgetsOptions.checkBoxIcon,
                  color: WidgetsOptions.checkBoxIconStyles.color,
                  weight: WidgetsOptions.checkBoxIconStyles.fontWeight,
                  size: WidgetsOptions.checkBoxSize * WidgetsOptions.checkBoxIconSize,
                )
              : null,
        ),
      ),
    );
  }
}
