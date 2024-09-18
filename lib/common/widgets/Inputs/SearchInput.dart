import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/constants/sizes.dart';
import 'package:tproject/util/options/input.dart';

class UISearchInput extends UIInput {
  UISearchInput(
    super.label,
    super.value, {
    super.key,
    super.isPlaceholder = TInputOptions.inputSearchIsPlaceholder,
    super.autofocus = TInputOptions.inputSearchAutofocus,
    super.onSubmit,
    super.onChange,
  }) : super(
          styles: (bool hasError) => TInputOptions.inputSearchStyles,
          padding: TInputOptions.inputSearchPadding,
          prefixIcon: TInputOptions.inputSearchPrefixIcon,
          prefixIconStyles: TInputOptions.inputSearchPrefixIconStyles,
          suffixIcon: TInputOptions.inputSearchSuffixIcon != null
              ? UIIconButton(
                  TInputOptions.inputSearchSuffixIcon!,
                  () => value.text = '',
                  radius: TSizes.radius,
                  styles: TInputOptions.inputSearchSuffixIconStyles,
                )
              : null,
        );
}
