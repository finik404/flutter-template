import 'package:flutter/material.dart';
import 'package:template/components/UI/Icon.dart';
import 'package:template/components/UI/IconBtn.dart';
import 'package:template/constants/colors.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:template/constants/icons.dart';

enum InputType { password }

/*
  Input Component ----------------
 */
class Input extends StatefulWidget {
  // Variables ----------------
  final String text;
  final TextEditingController value;
  final TextInputType? textType;
  final String? Function(String?)? validator;
  final Function(String)? onChange;
  final bool? isPlaceholder;
  final bool? isPassword;
  final bool? hasClear;
  final String? iconStart;
  final String? iconEnd;
  final double? width;
  final Color? bg;
  final Color? textColor;
  final Color? placeholderColor;
  final double? textSize;
  final FontWeight? textWeight;
  final double? iconSize;
  final double? iconStartSize;
  final double? iconEndSize;
  final Color? iconColor;
  final Color? iconStartColor;
  final Color? iconEndColor;
  final bool? isRightSideIcon;
  final EdgeInsets? padding;
  final double? radius;
  final BorderRadius? borderRadius;
  final BorderSide? border;
  final Color? shadowColor;
  final double? elevation;
  final double? widthBetween;
  final double? borderWidth;
  final bool? noBorder;
  final Function()? clearCallback;
  final int? minLines;
  final int? maxLines;
  final bool? isTextArea;
  final bool? enabled;

  // Props ----------------
  const Input(
    this.text,
    this.value, {
    this.textType = TextInputType.text,
    this.validator,
    this.onChange,
    this.isPlaceholder,
    this.iconStart,
    this.iconEnd,
    this.width,
    this.bg,
    this.placeholderColor,
    this.textColor,
    this.textSize,
    this.textWeight,
    this.iconSize,
    this.iconStartSize,
    this.iconEndSize,
    this.iconStartColor,
    this.iconEndColor,
    this.iconColor,
    this.isRightSideIcon,
    this.widthBetween,
    this.padding,
    this.radius,
    this.borderRadius,
    this.border,
    this.shadowColor,
    this.elevation,
    this.isPassword,
    this.hasClear,
    this.borderWidth,
    this.noBorder,
    this.clearCallback,
    this.minLines,
    this.maxLines,
    this.isTextArea,
    this.enabled,
    super.key,
  });

  // Builder ----------------
  @override
  InputState createState() => InputState();
}

/*
  State Component ----------------
 */
class InputState extends State<Input> {
  // Variables ----------------
  bool isShowPassword = false;
  late FocusNode isFocus = FocusNode();

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    bool isPassword = widget.isPassword == true;
    bool isPhone = widget.textType == TextInputType.phone;
    var maskFormatter = MaskTextInputFormatter(
        mask: '+7 ### ### ## ##', filter: {"#": RegExp(r'[0-9]')});

    return TextFormField(
      controller: widget.value,
      keyboardType: widget.textType,
      inputFormatters: isPhone ? [maskFormatter] : [],
      obscureText: isPassword && !isShowPassword,
      validator: widget.validator,
      onChanged: widget.onChange,
      enabled: widget.enabled,
      style: TextStyle(fontSize: widget.textSize ?? 16, height: 1),
      minLines: widget.minLines ?? 1,
      maxLines: widget.isTextArea == true ? null : widget.maxLines ?? 1,
      decoration: InputDecoration(
        isDense: false,
        labelText: widget.isPlaceholder == true ? null : widget.text,
        hintText: widget.isPlaceholder == true ? widget.text : null,
        labelStyle: TextStyle(
            color: widget.placeholderColor ?? AppColors.blue.withOpacity(0.5),
            fontSize: widget.textSize ?? 16),
        floatingLabelStyle:
            const TextStyle(color: AppColors.blue, fontSize: 18),
        contentPadding: widget.padding ??
            const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
        hintStyle: TextStyle(
            fontSize: widget.textSize ?? 16,
            color: widget.placeholderColor ?? AppColors.blue,
            height: 1),
        prefixIcon: widget.iconStart != null
            ? CIcon(widget.iconStart!,
                color: widget.iconStartColor ?? widget.iconColor,
                size: widget.iconStartSize ?? widget.iconSize)
            : null,
        suffixIcon: widget.iconEnd != null
            ? CIcon(widget.iconEnd!,
                color: widget.iconEndColor ?? widget.iconColor,
                size: widget.iconEndSize ?? widget.iconSize)
            :
            // Если это пароль
            isPassword
                ? IconButton(
                    // Переключить видимость пароля
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    // Иконка
                    icon: CIcon(
                        isShowPassword ? CIcons.password_no : CIcons.password),
                    color: AppColors.blue)
                :
                // Если это поиск
                widget.hasClear == true && widget.clearCallback != null
                    ? IconBtn(
                        'f00d',
                        func: () {
                          // Очистить поле
                          widget.value.clear();
                          widget.clearCallback!();
                        },
                      )
                    : null,
        filled: true,
        fillColor: widget.bg ?? AppColors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 6),
          borderSide: BorderSide(
            width: widget.noBorder == true ? 0 : 2,
            color: widget.noBorder == true
                ? Colors.transparent
                : AppColors.blue.withOpacity(0.3),
          ),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 6),
          borderSide: BorderSide(
            width: widget.noBorder == true ? 0 : 2,
            color: widget.noBorder == true
                ? Colors.transparent
                : AppColors.blue.withOpacity(0.3),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 6),
          borderSide:
              BorderSide(width: widget.borderWidth ?? 2, color: AppColors.blue),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 6),
          borderSide: BorderSide(
              width: widget.borderWidth ?? 2,
              color: AppColors.red.withOpacity(0.5)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius:
              widget.borderRadius ?? BorderRadius.circular(widget.radius ?? 6),
          borderSide: BorderSide(
              width: widget.borderWidth ?? 2,
              color: AppColors.red.withOpacity(0.5)),
        ),
      ),
    );
  }
}
