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
    super.textSize,
    super.textColor,
    super.textWeight,
    super.icon,
    super.iconSize,
    super.iconColor,
    super.iconWeight,
    super.spaceBetween,
    super.isRightIcon,
    super.isFullWidth,
  }) : super(
          styles: Themes.buttonSecondaryTheme.style,
        );
}
