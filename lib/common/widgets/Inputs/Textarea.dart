import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/options/input.dart';

class UITextArea extends UIInput {
  UITextArea(
    super.label,
    super.value, {
    super.key,
    super.validate,
    super.isPlaceholder = TInputOptions.textareaIsPlaceholder,
    super.autofocus,
    super.onSubmit,
    super.onChange,
    super.prefixIcon,
    super.suffixIcon,
    super.prefixIconStyles,
    super.maxLength,
    super.counterOptions,
  }) : super(
          styles: (bool hasError) => TInputOptions.textareaStyles,
          padding: TInputOptions.textareaPadding,
          minLines: TInputOptions.textareaMinLines,
          maxLines: TInputOptions.textareaMaxLines,
          textAreaIsInfinity: TInputOptions.textAreaIsInfinity,
        );
}
