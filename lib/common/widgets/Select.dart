import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/models.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:tproject/util/extensions/media.dart';
import 'package:tproject/util/theme/themes.dart';

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
      label: UIText('label', styles: labelStyles ?? TOptions.selectLabelStyles),

      // Styles
      inputDecorationTheme: styles ?? TOptions.selectStyles,

      // Icon
      trailingIcon: UIIcon(TIcons.down, styles: iconStyles ?? TOptions.selectIconStyles),
      selectedTrailingIcon: UIIcon(TIcons.up, styles: iconStyles ?? TOptions.selectIconStyles),

      // Menu styles
      menuStyle: menuStyles ?? TOptions.selectMenuStyles,

      // Items
      dropdownMenuEntries: items.map((item) {
        return DropdownMenuEntry(value: item.value, label: item.label, style: TOptions.selectMenuItemStyles);
      }).toList(),
    );
  }
}
