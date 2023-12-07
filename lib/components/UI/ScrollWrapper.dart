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
    Key? key,
  }) : super(key: key);

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
class CustomScrollBehavior extends MaterialScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return StretchingOverscrollIndicator(
      axisDirection: details.direction,
      child: child,
    );
  }
}
