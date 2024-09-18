import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/options/input.dart';

class UIPhoneInput extends UIInput {
  UIPhoneInput(
    super.label,
    super.value, {
    super.key,
    super.validate,
    super.isPlaceholder = TInputOptions.inputPhoneIsPlaceholder,
    super.autofocus,
    super.onSubmit,
    super.onChange,
    super.prefixIcon,
    super.prefixIconStyles,
    super.suffixIcon,
  }) : super(
          styles: (bool hasError) => TInputOptions.inputPhoneStyles,
          padding: TInputOptions.inputPhonePadding,
          type: TextInputType.phone,
          mask: TInputOptions.inputPhoneMask,
        );
}
