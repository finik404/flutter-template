import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/models/base.dart';
import 'package:tproject/util/extensions/media.dart';
import 'package:tproject/util/options/select.dart';

class UISelect extends StatelessWidget {
  const UISelect(
    this.value,
    this.onChange, {
    required this.items,
    this.label,
    this.labelStyles,
    this.iconStyles,
    this.styles,
    this.menuStyles,
    super.key,
  });

  final SelectItemModel value;
  final Function(SelectItemModel value) onChange;
  final List<SelectItemModel> items;
  final String? label;
  final TextStyle? labelStyles, iconStyles;
  final InputDecorationTheme? styles;
  final MenuStyle? menuStyles;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return DropdownMenu(
      width: context.screenWidth,

      // Value
      initialSelection: value,

      // Label
      label: UIText('label', styles: labelStyles ?? TSelectOptions.labelStyles),

      // Styles
      inputDecorationTheme: styles ?? TSelectOptions.styles,

      // Icon
      trailingIcon: UIIcon(TIcons.down, styles: iconStyles ?? TSelectOptions.iconStyles),
      selectedTrailingIcon: UIIcon(TIcons.up, styles: iconStyles ?? TSelectOptions.iconStyles),

      // Menu styles
      menuStyle: menuStyles ?? TSelectOptions.menuStyles,

      // Items
      dropdownMenuEntries: items.map((item) {
        return DropdownMenuEntry(value: item.value, label: item.label, style: TSelectOptions.menuItemStyles);
      }).toList(),
    );
  }
}
