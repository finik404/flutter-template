import 'package:flutter/material.dart';
import 'package:tproject/util/options/radiobutton.dart';

class UIRadio extends StatelessWidget {
  const UIRadio(
    this.isChecked, {
    super.key,
    this.size = TRadioButtonOptions.size,
    this.thumbSize = TRadioButtonOptions.thumbSize,
    this.borderWidth = TRadioButtonOptions.borderWidth,
    this.color,
    this.activeColor,
  });

  final bool isChecked;
  final double? size, thumbSize, borderWidth;
  final Color? color, activeColor;

  @override
  Widget build(BuildContext context) {
    Color customColor = color ?? TRadioButtonOptions.color;
    Color customActiveColor = activeColor ?? TRadioButtonOptions.activeColor;

    return Stack(
      children: [
        Container(
          width: 15,
          height: 15,
          decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1, color: isChecked ? customActiveColor : customColor)),
        ),
        if (isChecked)
          Positioned(
            top: 5,
            left: 5,
            child: Container(
              width: 5,
              height: 5,
              decoration: BoxDecoration(shape: BoxShape.circle, color: customActiveColor),
            ),
          ),
      ],
    );
  }
}
