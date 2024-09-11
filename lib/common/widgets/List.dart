import 'package:flutter/material.dart';
import 'package:tproject/util/constants/options.dart';

class UIList extends StatelessWidget {
  const UIList({
    super.key,
    required this.length,
    required this.child,
    this.direction = WidgetsOptions.listDirection,
    this.hasScroll = WidgetsOptions.listHasScroll,
    this.padding = WidgetsOptions.listPadding,
    this.spaceBetween = WidgetsOptions.listSpaceBetween,
    this.separator,
    this.height = WidgetsOptions.listHeight,
    this.controller,
  });

  final int length;
  final dynamic child;
  final Axis direction;
  final bool hasScroll;
  final EdgeInsetsGeometry padding;
  final Function(BuildContext)? separator;
  final double spaceBetween;
  final double? height;
  final ScrollController? controller;

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
          return separator!(context);
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

    return height != null ? SizedBox(height: height, child: list) : list;
  }
}
