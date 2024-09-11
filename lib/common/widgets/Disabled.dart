import 'package:flutter/material.dart';

class UIDisabled extends StatelessWidget {
  const UIDisabled({
    super.key,
    required this.isDisabled,
    required this.child,
    this.noOpacity,
  });

  final Widget child;
  final bool isDisabled;
  final bool? noOpacity;

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
