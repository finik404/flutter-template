import 'package:flutter/material.dart';
import 'package:tproject/util/constants/options.dart';

class UIList extends StatelessWidget {
  const UIList({
    super.key,
    required this.length,
    required this.child,
    this.direction = TOptions.listDirection,
    this.hasScroll = TOptions.listHasScroll,
    this.padding = TOptions.listPadding,
    this.spaceBetween = TOptions.listSpaceBetween,
    this.separator,
    this.height = TOptions.listHeight,
    this.controller,
    this.onRefresh,
  });

  final int length;
  final dynamic child;
  final Axis direction;
  final bool hasScroll;
  final EdgeInsetsGeometry padding;
  final Widget? separator;
  final double spaceBetween;
  final double? height;
  final ScrollController? controller;
  final Future<void> Function()? onRefresh;

  @override
  Widget build(BuildContext context) {
    Widget list = ListView.separated(
      itemCount: length,
      controller: controller,
      padding: padding,

      // Scroll options
      scrollDirection: direction,
      shrinkWrap: !hasScroll,
      physics: !hasScroll ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),

      // Separator
      separatorBuilder: (context, index) {
        if (separator != null) {
          // Custom separator
          return separator!;
        } else {
          // Spacing
          return SizedBox(
            width: direction == Axis.horizontal ? spaceBetween : 0,
            height: direction == Axis.vertical ? spaceBetween : 0,
          );
        }
      },

      // Items
      itemBuilder: (context, index) {
        if (child != null) {
          if (child is Widget Function(int)) {
            return child(index);
          } else {
            return child;
          }
        }
      },
    );

    list = height != null ? SizedBox(height: height, child: list) : list;

    // List with refresh indicator
    return onRefresh != null
        ? RefreshIndicator(
            onRefresh: onRefresh!,
            color: TOptions.refreshColor,
            backgroundColor: TOptions.refreshBackground,
            child: list,
          )
        : list;
  }
}
