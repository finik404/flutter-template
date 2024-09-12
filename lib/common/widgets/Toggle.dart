import 'package:flutter/material.dart';
import 'package:tproject/util/constants/options.dart';

class UIToggle extends StatelessWidget {
  const UIToggle(
    this.value, {
    super.key,
    this.onChange,
    this.width = WidgetsOptions.toggleWidth,
    this.height = WidgetsOptions.toggleHeight,
    this.color,
    this.activeColor,
    this.thumbSize = WidgetsOptions.toggleThumbSize,
    this.thumbColor,
    this.thumbActiveColor,
    this.sideBetween = WidgetsOptions.toggleThumbSideBetween,
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
    BoxDecoration toggleDecoration = decoration ?? WidgetsOptions.toggleDecoration;
    BoxDecoration toggleThumbDecoration = thumbDecoration ?? WidgetsOptions.toggleThumbDecoration;

    return GestureDetector(
      // onTap
      onTap: onChange != null ? () => onChange!() : null,

      // Toggle
      child: AnimatedContainer(
        duration: const Duration(milliseconds: WidgetsOptions.toggleDuration),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: value ? activeColor ?? WidgetsOptions.toggleActiveColor : color ?? WidgetsOptions.toggleColor,
          boxShadow: toggleDecoration.boxShadow,
          border: toggleDecoration.border,
        ),

        // Thumb
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: WidgetsOptions.toggleDuration),
              left: value ? null : sideBetween,
              right: value ? sideBetween : null,
              top: (height - thumbSize) / 2,
              child: Container(
                height: thumbSize,
                width: thumbSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? thumbActiveColor ?? WidgetsOptions.toggleThumbActiveColor : thumbColor ?? WidgetsOptions.toggleThumbColor,
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
