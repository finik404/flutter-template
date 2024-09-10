import 'package:flutter/material.dart';
import 'package:talktime/config/constants/styles.dart';

/*
  CList Component ----------------
 */
class CList extends StatelessWidget {
  // Variables ----------------
  final int length;
  final Function(BuildContext, int)? builder;
  final dynamic child;
  final ScrollController? controller;
  final EdgeInsetsGeometry? padding;
  final Axis? direction;
  final bool? noScroll;
  final double? separatorWidth;
  final Function(BuildContext)? separator;
  final bool? hasPad;
  final double? height;

  // Props ----------------
  const CList({
    super.key,
    required this.length,
    this.builder,
    this.child,
    this.controller,
    this.padding,
    this.direction = Axis.vertical,
    this.noScroll = true,
    this.separatorWidth,
    this.separator,
    this.hasPad,
    this.height,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    final list = MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: ListView.separated(
        itemCount: length,
        controller: controller,
        scrollDirection: direction ?? Axis.vertical,
        padding: hasPad == true ? Styles.pad : padding,
        shrinkWrap: noScroll ?? false,
        physics: noScroll ?? false
            ? const NeverScrollableScrollPhysics()
            : const AlwaysScrollableScrollPhysics(),
        separatorBuilder: (context, index) {
          if (separator != null) {
            return separator!(context);
          } else {
            return SizedBox(
              width: direction == Axis.horizontal ? separatorWidth ?? 0 : 0,
              height: direction == Axis.vertical ? separatorWidth ?? 0 : 0,
            );
          }
        },
        itemBuilder: (context, index) {
          if (builder != null) {
            return builder!(context, index);
          } else if (child != null) {
            if (child is Widget Function(int)) {
              return child(index);
            } else {
              return child;
            }
          }
          return Container();
        }));

    return height != null ? SizedBox(height: height, child: list) : list;
  }
}
