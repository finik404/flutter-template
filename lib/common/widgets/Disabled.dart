import 'package:flutter/material.dart';

/*
  Disabled Component ----------------
 */
class Disabled extends StatelessWidget {
  // Variables ----------------
  final Widget child;
  final bool isDisabled;
  final bool? noOpacity;

  // Props ----------------
  const Disabled({
    super.key,
    required this.isDisabled,
    required this.child,
    this.noOpacity,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: noOpacity == true
          ? 1.0
          : isDisabled
              ? 0.5
              : 1.0,
      child: IgnorePointer(
        ignoring: isDisabled,
        child: child,
      ),
    );
  }
}
