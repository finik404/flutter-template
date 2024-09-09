import 'package:flutter/material.dart';

/*
  ScrollWrapper Component ----------------
 */
class ScrollWrapper extends StatelessWidget {
  // Variables ----------------
  final Widget child;

  // Props ----------------
  const ScrollWrapper(
    this.child, {
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: CustomScrollBehavior(),
      child: child,
    );
  }
}

/*
  ScrollBehavior ----------------
 */
class CustomScrollBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}
