import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/theme/themes.dart';
import 'package:tproject/util/validators/validation.dart';

enum InputTypes { password, email, phone, address, textArea, number }

class UIInput extends StatefulWidget {
  const UIInput(
    this.label,
    this.value, {
    super.key,
    this.validate,
    this.isPlaceholder = false,
    this.autofocus = false,
    this.padding,
    this.onSubmit,
    this.onChange,

    // this.type,
    // this.onChange,
    // this.iconStart,
    // this.iconEnd,
    // this.width,
    // this.bg,
    // this.placeholderColor,
    // this.textColor,
    // this.textSize,
    // this.textWeight,
    // this.iconSize,
    // this.iconStartSize,
    // this.iconEndSize,
    // this.iconStartColor,
    // this.iconEndColor,
    // this.iconColor,
    // this.isRightSideIcon,
    // this.widthBetween,
    // this.padding,
    // this.radius,
    // this.borderRadius,
    // this.border,
    // this.shadowColor,
    // this.elevation,
    // this.hasClear,
    // this.borderWidth,
    // this.noBorder,
    // this.clearCallback,
    // this.enabled,
    // this.height,
    // this.minLines,
    // this.maxLines,
    // this.focusNode,
    // this.maxLength,
  });

  final String label;
  final TextEditingController value;
  final List<Function(String?)?>? validate;
  final bool autofocus, isPlaceholder;
  final EdgeInsets? padding;
  final Function()? onSubmit;
  final Function(String)? onChange;

  // final InputTypes? type;
  // final bool? isPlaceholder;
  // final bool? hasClear;
  // final String? iconStart;
  // final String? iconEnd;
  // final double? width;
  // final Color? bg;
  // final Color? textColor;
  // final Color? placeholderColor;
  // final double? textSize;
  // final FontWeight? textWeight;
  // final double? iconSize;
  // final double? iconStartSize;
  // final double? iconEndSize;
  // final Color? iconColor;
  // final Color? iconStartColor;
  // final Color? iconEndColor;
  // final bool? isRightSideIcon;
  // final EdgeInsets? padding;
  // final double? radius;
  // final BorderRadius? borderRadius;
  // final BorderSide? border;
  // final Color? shadowColor;
  // final double? elevation;
  // final double? widthBetween;
  // final double? borderWidth;
  // final bool? noBorder;
  // final Function()? clearCallback;
  // final bool? enabled;
  // final double? height;
  // final int? minLines;
  // final int? maxLines;
  // final FocusNode? focusNode;
  // final int? maxLength;

  // Variables ----------------
  // bool isShowPassword = false;
  // bool hasError = false;
  // late FocusNode isFocus = FocusNode();
  // bool isTextNotEmpty = false;
  //
  // @override
  // void initState() {
  //   super.initState();
  //   isTextNotEmpty = widget.value.text.isNotEmpty;
  //
  //   widget.value.addListener(() {
  //     setState(() {
  //       isTextNotEmpty = widget.value.text.isNotEmpty;
  //     });
  //   });
  // }

  @override
  UIInputState createState() => UIInputState();
}

/*
      State Component ----------------
     */
class UIInputState extends State<UIInput> {
  String error = '';

  @override
  Widget build(BuildContext context) {
    // TextInputType textType = TextInputType.text;

    // Type
    // if (widget.type == InputTypes.email) {
    //   textType = TextInputType.emailAddress;
    // } else if (widget.type == InputTypes.phone) {
    //   textType == TextInputType.phone;
    // } else if (widget.type == InputTypes.address) {
    //   textType = TextInputType.streetAddress;
    // } else if (widget.type == InputTypes.number) {
    //   textType = TextInputType.number;
    // }

    // Border
    // BorderRadius borderRadius = widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 10);
    // BorderSide? commonBorderSide =
    //     widget.noBorder == true ? const BorderSide(width: 0, color: Colors.transparent) : const BorderSide(width: 1, color: TColors.grayLight);
    // BorderSide disabledBorderSide = BorderSide(
    //   width: widget.noBorder == true ? 0 : 2,
    //   color: widget.noBorder == true ? Colors.transparent : context.primaryColor.withOpacity(0.55),
    // );

    InputDecorationTheme inputStyles = Themes.inputTheme(error.isNotEmpty);

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

            // counterText: '',
            // suffixIcon: widget.iconEnd != null
            //     ? CIcon(widget.iconEnd!, color: widget.iconEndColor ?? widget.iconColor, size: widget.iconEndSize ?? widget.iconSize ?? 16)
            //     :
            //     // Password type
            //     widget.type == InputTypes.password && isTextNotEmpty
            //         ? Container(
            //             margin: const EdgeInsets.only(right: 5),
            //             child: IconBtn(
            //               isShowPassword ? TIcons.password_no : TIcons.password,
            //               // Toggle show password
            //               onTap: () => setState(() => isShowPassword = !isShowPassword),
            //               size: 18,
            //               color: TColors.black,
            //             ))
            //         :
            //         // Search type
            //         widget.hasClear == true && widget.clearCallback != null
            //             ? IconBtn(
            //                 TIcons.close,
            //                 color: TColors.gray,
            //                 margin: const EdgeInsets.only(right: 5),
            //                 onTap: () {
            //                   // Clear input
            //                   widget.value.clear();
            //                   widget.clearCallback!();
            //                 },
            //               )
            //             : null,
          ),
          // keyboardType: textType,
          // obscureText: widget.type == InputTypes.password && !isShowPassword,
          // focusNode: widget.focusNode,
          // maxLength: widget.maxLength,
          // minLines: widget.minLines ?? 1,
          // maxLines: widget.type == InputTypes.textArea ? null : widget.maxLines ?? 1,
          // style: TextStyle(
          //     fontFamily: Variables.apiUrl, fontSize: widget.textSize ?? 16, height: 1.3, color: TColors.black, fontWeight: FontWeight.normal),
        ),

        // Errors
        if (error.isNotEmpty) UIText(error, styles: inputStyles.errorStyle, lineHeight: 2.5),
      ],
    );
  }
}
