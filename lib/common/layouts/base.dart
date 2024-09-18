import 'package:flutter/material.dart';
import 'package:tproject/util/options/base_layout.dart';

class BaseLayout extends StatelessWidget {
  const BaseLayout({
    super.key,
    this.children,
    this.child,
    this.bg,
    this.padding,
    this.isScrollable = TBaseLayoutOptions.isScrollable,
    this.hasSafeArea = TBaseLayoutOptions.hasSafeArea,
    this.hasTop = TBaseLayoutOptions.hasTop,
  });

  final List<Widget>? children;
  final Widget? child;
  final Color? bg;
  final EdgeInsets? padding;
  final bool isScrollable;
  final bool hasSafeArea;
  final bool hasTop;

  @override
  Widget build(BuildContext context) {
    Widget content = Container();
    EdgeInsets? customPadding = padding ?? TBaseLayoutOptions.padding;

    if (child != null) {
      content = child!;
    } else if (children != null) {
      content = Column(children: children!);
    }

    if (customPadding != null) {
      content = Padding(padding: customPadding!, child: content);
    }

    if (isScrollable) {
      content = SingleChildScrollView(child: content);
    }

    return hasSafeArea ? Scaffold(backgroundColor: bg, body: SafeArea(top: hasTop, child: content)) : content;
  }
}
