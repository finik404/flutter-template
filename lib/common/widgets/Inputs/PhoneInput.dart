import 'package:easy_mask/easy_mask.dart';
import 'package:flutter/cupertino.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/constants/options.dart';

class UIPhoneInput extends UIInput {
  UIPhoneInput(
    super.label,
    super.value, {
    super.key,
    super.validate,
    super.isPlaceholder = TOptions.inputPhoneIsPlaceholder,
    super.autofocus,
    super.onSubmit,
    super.onChange,
    super.prefixIcon,
    super.prefixIconStyles,
    super.suffixIcon,
  }) : super(
          styles: (bool hasError) => TOptions.inputPhoneStyles,
          padding: TOptions.inputPhonePadding,
          type: TextInputType.phone,
          mask: TextInputMask(mask: '\\+7 999 999 99 99'),
        );
}
