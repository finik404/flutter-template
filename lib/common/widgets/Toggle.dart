import 'package:flutter/material.dart';
import 'package:tproject/util/constants/options.dart';

class UIToggle extends StatelessWidget {
  const UIToggle(
    this.value, {
    super.key,
    this.onChange,
    this.width = TOptions.toggleWidth,
    this.height = TOptions.toggleHeight,
    this.color,
    this.activeColor,
    this.thumbSize = TOptions.toggleThumbSize,
    this.thumbColor,
    this.thumbActiveColor,
    this.sideBetween = TOptions.toggleThumbSideBetween,
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
    BoxDecoration toggleDecoration = decoration ?? TOptions.toggleDecoration;
    BoxDecoration toggleThumbDecoration = thumbDecoration ?? TOptions.toggleThumbDecoration;

    return GestureDetector(
      // onTap
      onTap: onChange != null ? () => onChange!() : null,

      // Toggle
      child: AnimatedContainer(
        duration: const Duration(milliseconds: TOptions.toggleDuration),
        width: width,
        height: height,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.0),
          color: value ? activeColor ?? TOptions.toggleActiveColor : color ?? TOptions.toggleColor,
          boxShadow: toggleDecoration.boxShadow,
          border: toggleDecoration.border,
        ),

        // Thumb
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: TOptions.toggleDuration),
              left: value ? null : sideBetween,
              right: value ? sideBetween : null,
              top: (height - thumbSize) / 2,
              child: Container(
                height: thumbSize,
                width: thumbSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? thumbActiveColor ?? TOptions.toggleThumbActiveColor : thumbColor ?? TOptions.toggleThumbColor,
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
