import 'package:flutter/material.dart';
import 'package:tproject/common/layouts/base.dart';
import 'package:tproject/common/layouts/main/widgets/Header.dart';
import 'package:tproject/common/widgets/Refresh.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class MainLayout extends StatelessWidget {
  const MainLayout({
    super.key,
    this.label,
    required this.child,
    this.padding,
    this.bottom,
    this.hasArrow = false,
    this.hasBottomContainer = true,
    this.refresh,
    this.header,
  });

  final Widget child;
  final String? label;
  final Widget? header;
  final EdgeInsets? padding;
  final Widget? bottom;
  final Future<void> Function()? refresh;
  final bool hasArrow, hasBottomContainer;

  @override
  Widget build(BuildContext context) {
    Widget scrollContent = SingleChildScrollView(
      child: Container(
        padding: hasArrow ? const EdgeInsets.only(top: 18, bottom: 30) : const EdgeInsets.only(bottom: 30),
        child: Padding(padding: padding ?? TStyles.pd, child: child),
      ),
    );

    return BaseLayout(
      padding: EdgeInsets.zero,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Scrollable content
          Expanded(
            child: NestedScrollView(
              headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
                return [
                  if (header != null) header! else if (label != null) Header(label!, hasArrow: hasArrow),
                ];
              },
              body: refresh != null ? UIRefresh(refresh: refresh!, child: scrollContent) : scrollContent,
            ),
          ),

          // Bottom
          if (bottom != null)
            hasBottomContainer
                ? Container(
                    padding: const EdgeInsets.all(20),
                    decoration: const BoxDecoration(
                      color: TColors.bg,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(8),
                        topRight: Radius.circular(8),
                      ),
                    ),
                    child: bottom!,
                  )
                : bottom!,
        ],
      ),
    );
  }
}
