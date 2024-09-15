import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Inputs/Input.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:tproject/util/constants/sizes.dart';

class UISearchInput extends UIInput {
  UISearchInput(
    super.label,
    super.value, {
    super.key,
    super.isPlaceholder = TOptions.inputSearchIsPlaceholder,
    super.autofocus = TOptions.inputSearchAutofocus,
    super.onSubmit,
    super.onChange,
  }) : super(
          styles: (bool hasError) => TOptions.inputSearchStyles,
          padding: TOptions.inputSearchPadding,
          prefixIcon: TOptions.inputSearchPrefixIcon,
          prefixIconStyles: TOptions.inputSearchPrefixIconStyles,
          suffixIcon: TOptions.inputSearchSuffixIcon != null
              ? UIIconButton(
                  TOptions.inputSearchSuffixIcon!,
                  () => value.text = '',
                  radius: TSizes.radius,
                  styles: TOptions.inputSearchSuffixIconStyles,
                )
              : null,
        );
}
