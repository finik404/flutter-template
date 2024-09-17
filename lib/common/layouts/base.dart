import 'package:flutter/material.dart';
import 'package:tproject/util/logging/logger.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    super.key,
    this.children,
    this.child,
    this.bg,
    this.padding,
    this.isScrollable = false,
    this.noSafeArea = false,
    this.noTop = true,
  });

  final List<Widget>? children;
  final Widget? child;
  final Color? bg;
  final EdgeInsets? padding;
  final bool isScrollable;
  final bool noSafeArea;
  final bool noTop;

  @override
  Widget build(BuildContext context) {
    Widget content = Container();

    if (child != null) {
      content = child!;
    } else if (children != null) {
      content = Column(children: children!);
    } else {
      TLogger.error('Base layout: the child or children argument was not passed!');
    }


    if (padding != null) {
      content = Padding(padding: padding!, child: content);
    }

    if (isScrollable) {
      content = SingleChildScrollView(child: content);
    }

    return noSafeArea ? content : Scaffold(backgroundColor: bg, body: SafeArea(top: !noTop, child: content));
  }
}
