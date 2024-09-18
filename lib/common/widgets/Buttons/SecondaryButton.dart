import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/util/options/button.dart';

class UISecondaryButton extends UIButton {
  UISecondaryButton(
    super.label,
    super.onTap, {
    super.key,
    super.onLongTap,
    super.isDisabled,
    super.textStyles,
    super.icon,
    super.customIcon,
    super.iconStyles,
    super.spaceBetween,
    super.isRightIcon,
    super.isFullWidth,
    super.padding,
  }) : super(
          styles: TButtonOptions.buttonSecondaryTheme(padding: padding).style,
        );
}
