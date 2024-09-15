import 'package:flutter/cupertino.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class UIPhoneInput extends UIInput {
  UIPhoneInput(
    super.label,
    super.value, {
    super.key,
    super.isPlaceholder = TOptions.inputPhoneIsPlaceholder,
    super.autofocus,
    super.onSubmit,
    super.onChange,
  }) : super(
          styles: (bool hasError) => TOptions.inputPhoneStyles,
          padding: TOptions.inputPhonePadding,
          type: TextInputType.phone,
          mask: MaskTextInputFormatter(mask: '+7 ### ### ## ##', filter: {"#": RegExp(r'[0-9]')}),
        );
}
