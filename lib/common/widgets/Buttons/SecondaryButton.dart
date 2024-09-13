import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/util/theme/themes.dart';

class UISecondaryButton extends UIButton {
  UISecondaryButton(
    super.label,
    super.onTap, {
    super.key,
    super.onLongTap,
    super.isDisabled,
    super.textStyles,
    super.icon,
    super.iconStyles,
    super.spaceBetween,
    super.isRightIcon,
    super.isFullWidth,
  }) : super(
          styles: Themes.buttonSecondaryTheme.style,
        );
}
