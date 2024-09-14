import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:tproject/util/theme/themes.dart';
import 'package:tproject/util/validators/validator.dart';
import 'package:tproject/util/constants/enums.dart';

export 'package:tproject/util/constants/enums.dart';

class UIInput extends StatefulWidget {
  const UIInput(
    this.label,
    this.value, {
    super.key,
    this.validate,
    this.styles,
    this.isPlaceholder = false,
    this.autofocus = false,
    this.padding,
    this.onSubmit,
    this.onChange,
    this.type = TextInputType.text,
    this.prefixIcon,
    this.prefixIconStyles,
    this.maxLength,
    this.counter = TOptions.inputHasCounter,
    this.suffixIcon,
  });

  final String label;
  final TextEditingController value;
  final List<Function(String?)?>? validate;
  final bool autofocus, isPlaceholder;
  final InputDecorationTheme? styles;
  final EdgeInsets? padding;
  final Function()? onSubmit;
  final Function(String)? onChange;
  final TextInputType type;
  final String? prefixIcon;
  final TextStyle? prefixIconStyles;
  final int? maxLength;
  final InputCounterOptions counter;
  final Widget? suffixIcon;

  @override
  UIInputState createState() => UIInputState();
}

class UIInputState extends State<UIInput> {
  String error = '';
  String counter = '';

  @override
  Widget build(BuildContext context) {
    TextInputType type = TextInputType.text;

    // Default styles
    InputDecorationTheme inputStyles = widget.styles ?? Themes.inputTheme(error.isNotEmpty);
    TextStyle inputPrefixIconStyles = widget.prefixIconStyles ?? TextStyle();

    print('counter ${counter}');
    print('counter ${widget.maxLength != null && widget.counter != InputCounterOptions.hide}');

    // Input ----------------
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          controller: widget.value,

          // Validation
          validator: (value) {
            String? errors = TValidator.validate(value, widget.validate);
            setState(() => error = errors ?? '');
          },

          // onChange
          onChanged: widget.onChange,
          // onSubmit
          onFieldSubmitted: widget.onSubmit != null ? (value) => widget.onSubmit!() : null,
          // autofocus
          autofocus: widget.autofocus,

          // Type
          keyboardType: type,

          // MaxLength
          maxLength: widget.maxLength,

          // Styles
          decoration: InputDecoration(
            isDense: true,

            // Label
            labelText: widget.isPlaceholder ? null : widget.label,
            hintText: widget.isPlaceholder ? widget.label : null,

            // Padding
            contentPadding: widget.padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),

            // Background
            filled: true,
            fillColor: inputStyles.fillColor,

            // Label styles
            labelStyle: inputStyles.labelStyle,
            floatingLabelStyle: inputStyles.floatingLabelStyle,

            // Placeholder styles
            hintStyle: inputStyles.hintStyle,

            // Borders
            enabledBorder: inputStyles.enabledBorder,
            focusedBorder: inputStyles.focusedBorder,

            // Errors styles
            errorStyle: inputStyles.errorStyle,

            // Icons
            prefixIcon: widget.prefixIcon != null ? UIIcon(widget.prefixIcon!, styles: inputPrefixIconStyles) : null,
            suffixIcon: widget.suffixIcon != null ? Padding(padding: const EdgeInsets.all(8.0), child: widget.suffixIcon) : null,
          ),

          // Counter
          buildCounter: widget.maxLength != null && widget.counter != InputCounterOptions.hide
              ? (BuildContext context, {required int currentLength, required bool isFocused, required int? maxLength}) {
                  int remaining = maxLength! - currentLength;
                  print('remaining');

                  // if (widget.counter == InputCounterOptions.show) {
                  //   setState(() => counter = '$currentLength / $maxLength');
                  // } else if (widget.counter == InputCounterOptions.showOnEnd) {
                  //   if (remaining <= 5) setState(() => counter = '$currentLength / $maxLength');
                  // }
                }
              : null,
        ),

        // Errors

        Row(children: [
          if (error.isNotEmpty) UIText(error, styles: inputStyles.errorStyle, lineHeight: 2.5),
          if (counter.isNotEmpty)
            Container(margin: const EdgeInsets.only(left: 10), child: UIText(counter, styles: TOptions.inputCounterStyles, lineHeight: 2.5)),
        ]),
      ],
    );
  }
}
