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
  });

  final bool value;
  final Function()? onChange;
  final double width;
  final double height;
  final Color? color, activeColor, thumbColor, thumbActiveColor;
  final double thumbSize;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
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
        ),

        // Thumb
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: WidgetsOptions.toggleDuration),
              left: value ? thumbSize : 0.0,
              right: value ? 0.0 : thumbSize,
              top: 3.5,
              child: Container(
                height: thumbSize,
                width: thumbSize,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: value ? thumbActiveColor ?? WidgetsOptions.toggleThumbActiveColor : thumbColor ?? WidgetsOptions.toggleThumbColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
