import 'package:flutter/material.dart';
import 'package:tproject/util/options/toggle.dart';

class UIToggle extends StatelessWidget {
  const UIToggle(
    this.value, {
    super.key,
    this.onChange,
    this.width = TToggleOptions.width,
    this.height = TToggleOptions.height,
    this.color,
    this.activeColor,
    this.thumbSize = TToggleOptions.thumbSize,
    this.thumbColor,
    this.thumbActiveColor,
    this.sideBetween = TToggleOptions.thumbSideBetween,
    this.decoration,
    this.thumbDecoration,
  });

  final bool value;
  final Function()? onChange;
  final double width;
  final double height;
  final Color? color, activeColor, thumbColor, thumbActiveColor;
  final double thumbSize, sideBetween;
  final BoxDecoration? decoration, thumbDecoration;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    BoxDecoration toggleDecoration = decoration ?? TToggleOptions.decoration;
    BoxDecoration toggleThumbDecoration = thumbDecoration ?? TToggleOptions.thumbDecoration;

    return GestureDetector(
      // onTap
      onTap: onChange != null ? () => onChange!() : null,

      // Toggle
      child: AnimatedContainer(
        duration: const Duration(milliseconds: TToggleOptions.duration),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: value ? activeColor ?? TToggleOptions.activeColor : color ?? TToggleOptions.color,
          boxShadow: toggleDecoration.boxShadow,
          border: toggleDecoration.border,
        ),

        // Thumb
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: TToggleOptions.duration),
              left: value ? null : sideBetween,
              right: value ? sideBetween : null,
              top: (height - thumbSize) / 2,
              child: Container(
                height: thumbSize,
                width: thumbSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? thumbActiveColor ?? TToggleOptions.thumbActiveColor : thumbColor ?? TToggleOptions.thumbColor,
                  boxShadow: toggleThumbDecoration.boxShadow,
                  border: toggleThumbDecoration.border,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
