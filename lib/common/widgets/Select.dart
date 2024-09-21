import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/models/base.dart';
import 'package:tproject/util/options/select.dart';

class UISelect extends StatelessWidget {
  const UISelect(
    this.value,
    this.onChange, {
    super.key,
    required this.items,
    this.label,
    this.labelStyles,
    this.iconStyles,
    this.styles,
    this.menuStyles,
    this.itemStyle,
    this.errors = '',
    this.isPlaceholder = TSelectOptions.isPlaceholder,
    this.width,
    this.padding,
  });

  final SelectItemModel value;
  final Function(SelectItemModel value) onChange;
  final List<SelectItemModel> items;
  final String? label;
  final TextStyle? labelStyles, iconStyles;
  final InputDecorationTheme? styles;
  final MenuStyle? menuStyles;
  final ButtonStyle? itemStyle;
  final String errors;
  final bool isPlaceholder;
  final double? width;
  final EdgeInsets? padding;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    InputDecorationTheme selectStyles = styles ?? TSelectOptions.styles!(errors.isNotEmpty, padding: padding);

    return Column(
      children: [
        DropdownMenu(
          width: width ?? TSelectOptions.width,

          // Value
          initialSelection: value,

          // Label
          label: isPlaceholder ? null : UIText(label!, styles: labelStyles ?? selectStyles.labelStyle),
          hintText: isPlaceholder ? label : null,

          // Styles
          inputDecorationTheme: selectStyles,

          // Icon
          trailingIcon: UIIcon(TIcons.down, styles: iconStyles ?? TSelectOptions.iconStyles),
          selectedTrailingIcon: UIIcon(TIcons.up, styles: iconStyles ?? TSelectOptions.iconStyles),

          // Menu styles
          menuStyle: menuStyles ?? TSelectOptions.menuStyles,

          // Items
          dropdownMenuEntries: items.map((item) {
            return DropdownMenuEntry(value: item.value, label: item.label, style: itemStyle ?? TSelectOptions.menuItemStyles);
          }).toList(),
        ),

        // Errors
        if (errors.isNotEmpty)
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 6, left: 5),
                child: UIText(errors, styles: selectStyles.errorStyle),
              ),
            ],
          ),
      ],
    );
  }
}
