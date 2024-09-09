import 'package:flutter/material.dart';

/*
  Base Layout ----------------
 */
class BaseLayout extends StatelessWidget {
  // Variables ----------------
  final Widget? child;
  final List<Widget>? children;
  final Color? bg;
  final EdgeInsets? padding;
  final bool? isScrollable;
  final bool? noSafeArea;
  final bool noTop;

  // Props ----------------
  const BaseLayout({
    super.key,
    this.child,
    this.children,
    this.bg,
    this.padding,
    this.isScrollable,
    this.noSafeArea,
    this.noTop = false,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    Widget content;

    if (child != null) {
      content = child!;
    } else if (children != null) {
      content = Column(children: children!);
    } else {
      throw ArgumentError('Не передан аргумент child или children');
    }

    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }

    if (isScrollable == true) {
      content = SingleChildScrollView(child: content);
    }

    return noSafeArea == true
        ? content
        : Scaffold(
            backgroundColor: bg ?? Theme.of(context).colorScheme.background,
            body: SafeArea(top: !noTop, child: content),
          );
  }
}
