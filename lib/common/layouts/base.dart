import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tproject/util/helpers/device.dart';
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
    this.leading,
    this.actions,
    this.appHeight = 0,
  });

  final List<Widget>? children;
  final Widget? child;
  final Color? bg;
  final EdgeInsets? padding;
  final bool isScrollable;
  final bool hasSafeArea;
  final bool hasTop;
  final Widget? leading, actions;
  final double appHeight;

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
      content = Padding(padding: customPadding, child: content);
    }

    if (isScrollable) {
      content = SingleChildScrollView(child: content);
    }

    return hasSafeArea
        ? Scaffold(
            appBar: AppBar(
              toolbarHeight: appHeight,
              elevation: 0,
              backgroundColor: Colors.transparent,
              surfaceTintColor: Colors.transparent,
              shadowColor: Colors.transparent,
              systemOverlayStyle: const SystemUiOverlayStyle(
                statusBarBrightness: Brightness.dark,
                statusBarIconBrightness: Brightness.dark,
              ),
              leading: leading,
              actions: [actions ?? Container()],
            ),
            backgroundColor: bg,
            body: SafeArea(
              top: hasTop,
              child: content,
            ),
          )
        : content;
  }
}
