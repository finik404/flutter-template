import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';

class UIToast extends StatelessWidget {
  const UIToast(
    this.text, {
    super.key,
    this.isWarning = false,
  });

  final String text;
  final bool isWarning;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.9,
      child: Container(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        decoration: BoxDecoration(
          color: isWarning ? TColors.warning : TColors.primary,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: const Offset(0, 3),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            UIIcon(FontAwesomeIcons.solidCircleCheck, color: isWarning ? TColors.black : TColors.white),
            const SizedBox(width: 12),
            Flexible(
              child: UIText(
                text,
                size: 14,
                weight: FontWeight.bold,
                color: isWarning ? TColors.black : TColors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
