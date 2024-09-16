import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:tproject/util/constants/sizes.dart';
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
    this.isPlaceholder = TOptions.inputIsPlaceholder,
    this.autofocus = false,
    this.padding,
    this.onSubmit,
    this.onChange,
    this.type = TextInputType.text,
    this.prefixIcon,
    this.prefixIconStyles,
    this.maxLength,
    this.counterOptions = TOptions.inputHasCounter,
    this.suffixIcon,
    this.minLines,
    this.maxLines,
    this.textAreaIsInfinity = false,
    this.mask,
    this.isPassword = false,
  });

  final String label;
  final TextEditingController value;
  final List<Function(String?)?>? validate;
  final bool autofocus, isPlaceholder, isPassword;
  final Function(bool)? styles;
  final EdgeInsets? padding;
  final Function()? onSubmit;
  final Function(String)? onChange;
  final TextInputType type;
  final String? prefixIcon;
  final TextStyle? prefixIconStyles;
  final int? maxLength;
  final InputCounterOptions counterOptions;
  final Widget? suffixIcon;
  final int? minLines, maxLines;
  final bool textAreaIsInfinity;
  final TextInputFormatter? mask;

  @override
  UIInputState createState() => UIInputState();
}

class UIInputState extends State<UIInput> {
  String error = '';
  String counter = '';
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    InputDecorationTheme inputStyles = widget.styles?.call(error.isNotEmpty) ?? TOptions.inputStyles(error.isNotEmpty);
    TextStyle inputPrefixIconStyles = widget.prefixIconStyles ?? TOptions.inputIconStyles;

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
          keyboardType: widget.type,

          // MaxLength
          maxLength: widget.maxLength,

          // Textarea options
          minLines: widget.minLines ?? 1,
          maxLines: widget.textAreaIsInfinity
              ? null
              : widget.minLines != null && widget.maxLines == null
                  ? widget.minLines
                  : widget.maxLines ?? 1,

          // Hide text
          obscureText: widget.isPassword && !showPassword,

          // Mask
          inputFormatters: widget.mask != null ? [widget.mask!] : [],

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
            suffixIcon:
                // Password button
                widget.isPassword
                    ? Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: UIIconButton(
                          TIcons.password,
                          () => setState(() => showPassword = !showPassword),
                          radius: TSizes.radius,
                          styles: TOptions.inputPasswordIconStyles,
                        ),
                      )

                    // SuffixIcon
                    : widget.suffixIcon != null
                        ? Padding(padding: const EdgeInsets.all(8.0), child: widget.suffixIcon)
                        : null,
          ),

          // Counter
          buildCounter: widget.maxLength != null && widget.counterOptions != InputCounterOptions.hide
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

        // Errors and counter
        Row(children: [
          if (error.isNotEmpty) UIText(error, styles: inputStyles.errorStyle, lineHeight: 2.5),
          if (counter.isNotEmpty)
            Container(margin: const EdgeInsets.only(left: 10), child: UIText(counter, styles: TOptions.inputCounterStyles, lineHeight: 2.5)),
        ]),
      ],
    );
  }
}
