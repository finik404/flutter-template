import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/constants/options.dart';

class UITextArea extends UIInput {
  UITextArea(
    super.label,
    super.value, {
    super.key,
    super.validate,
    super.isPlaceholder = TOptions.textareaIsPlaceholder,
    super.autofocus,
    super.onSubmit,
    super.onChange,
    super.prefixIcon,
    super.suffixIcon,
    super.prefixIconStyles,
    super.maxLength,
    super.counterOptions,
  }) : super(
          styles: (bool hasError) => TOptions.textareaStyles,
          padding: TOptions.textareaPadding,
          minLines: TOptions.textareaMinLines,
          maxLines: TOptions.textareaMaxLines,
          textAreaIsInfinity: TOptions.textAreaIsInfinity,
        );
}
