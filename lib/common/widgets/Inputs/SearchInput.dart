import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/sizes.dart';
import 'package:tproject/util/theme/themes.dart';

class UISearchInput extends UIInput {
  UISearchInput(
    super.label,
    super.value, {
    super.key,
    super.isPlaceholder = true,
    super.autofocus = true,
    super.padding,
    super.onSubmit,
    super.onChange,
  }) : super(
          prefixIcon: TIcons.search,
          prefixIconStyles: TextStyle(fontSize: 16, color: TColors.primary.withOpacity(0.5)),
          suffixIcon: UIIconButton(
            TIcons.close,
            () => value.text = '',
            radius: TSizes.radius,
            styles: TextStyle(fontSize: 18, color: TColors.primary.withOpacity(0.5)),
          ),
          styles: Themes.inputTheme(false),
        );
}
