import 'package:flutter/material.dart';
import 'package:tproject/util/validators/validation.dart';

enum InputTypes { password, email, phone, address, textArea, number }

class UIInput extends StatefulWidget {
  const UIInput(
    this.label,
    this.value, {
    super.key,
    this.isPlaceholder,
    this.padding,
    this.bg,
    this.autofocus,
    this.validate,

    // this.type,
    // this.validator,
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
    // this.onSubmit,
  });

  final String label;
  final TextEditingController value;
  final EdgeInsets? padding;
  final bool? autofocus, isPlaceholder;
  final Color? bg;
  final List<Function(String?)?>? validate;

  // final InputTypes? type;
  // final String? Function(String?)? validator;
  // final Function(String)? onChange;
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
  // final Function()? onSubmit;

  // Builder ----------------
  @override
  UIInputState createState() => UIInputState();
}

class UIInputState extends State<UIInput> {
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

  // Builder ----------------
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

    return TextFormField(
      controller: widget.value,
      autofocus: widget.autofocus ?? false,

      // Validation
      validator: (value) => TValidator.validate(value, widget.validate),

      // Styles
      decoration: InputDecoration(
        isDense: true,

        // Label
        labelText: widget.isPlaceholder == true ? null : widget.label,
        hintText: widget.isPlaceholder == true ? widget.label : null,

        // Padding
        contentPadding: widget.padding ?? const EdgeInsets.symmetric(vertical: 16, horizontal: 24),

        // Background
        filled: widget.bg != null,
        fillColor: widget.bg ?? Colors.transparent,


        // counterText: '',
        // errorStyle: const TextStyle(color: TColors.red),
        // hintStyle: TextStyle(
        //     fontSize: widget.textSize ?? 16, color: widget.placeholderColor ?? const Color(0xfff909090), height: 1.3, fontWeight: FontWeight.normal),
        // prefixIcon: widget.iconStart != null
        //     ? CIcon(widget.iconStart!, color: widget.iconStartColor ?? widget.iconColor, size: widget.iconStartSize ?? widget.iconSize ?? 16)
        //     : null,
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
        // enabledBorder: OutlineInputBorder(
        //   borderRadius: borderRadius,
        //   borderSide: commonBorderSide,
        // ),
        // disabledBorder: OutlineInputBorder(
        //   borderRadius: borderRadius,
        //   borderSide: disabledBorderSide,
        // ),
        // focusedBorder: OutlineInputBorder(
        //   borderRadius: borderRadius,
        //   borderSide: commonBorderSide,
        // ),
        // errorBorder: OutlineInputBorder(
        //   borderRadius: borderRadius,
        //   borderSide: commonBorderSide,
        // ),
        // focusedErrorBorder: OutlineInputBorder(
        //   borderRadius: borderRadius,
        //   borderSide: commonBorderSide,
        // ),
      ),
      // enabled: widget.enabled,
      // keyboardType: textType,
      // obscureText: widget.type == InputTypes.password && !isShowPassword,
      // onFieldSubmitted: widget.onSubmit != null ? (value) => widget.onSubmit!() : null,
      // validator: (value) {
      //   final error = widget.validator?.call(value);
      //   setState(() {
      //     hasError = error != null;
      //   });
      //   return error;
      // },
      // onChanged: widget.onChange,
      // focusNode: widget.focusNode,
      // maxLength: widget.maxLength,
      // minLines: widget.minLines ?? 1,
      // maxLines: widget.type == InputTypes.textArea ? null : widget.maxLines ?? 1,
      // style: TextStyle(
      //     fontFamily: Variables.apiUrl, fontSize: widget.textSize ?? 16, height: 1.3, color: TColors.black, fontWeight: FontWeight.normal),
    );
  }
}
