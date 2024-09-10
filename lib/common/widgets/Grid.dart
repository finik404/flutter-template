import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:talktime/core/extensions/theme.dart';

/*
  CGrid Component ----------------
 */
class CGrid extends StatelessWidget {
  // Variables ----------------
  final int length;
  final Function(BuildContext, int)? builder;
  final dynamic child;
  final ScrollController? controller;
  final bool? noScroll;
  final Future<void> Function()? onRefresh;
  final EdgeInsetsGeometry? padding;
  final double? aspect;
  final int? crossCount;
  final double? crossSpacing;
  final double? mainSpacing;
  final bool? isCustom;

  // Props ----------------
  const CGrid({
    super.key,
    required this.length,
    this.builder,
    this.child,
    this.controller,
    this.onRefresh,
    this.noScroll = true,
    this.padding,
    this.aspect = 1 / 1.3,
    this.crossCount = 2,
    this.crossSpacing = 0,
    this.mainSpacing = 5,
    this.isCustom,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    if (onRefresh != null) {
      return RefreshIndicator(
        onRefresh: onRefresh!,
        color: context.primaryColor,
        child: buildListView(context),
      );
    } else {
      return buildListView(context);
    }
  }

  dynamic buildListView(BuildContext context) {
    return MediaQuery.removePadding(
        context: context,
        removeTop: true,
        child: isCustom == true
            ? AlignedGridView.count(
                itemCount: length,
                controller: controller,
                padding: padding,
                shrinkWrap: noScroll ?? false,
                physics: noScroll ?? false ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                crossAxisCount: crossCount!,
                crossAxisSpacing: crossSpacing!,
                mainAxisSpacing: mainSpacing!,
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
                },
              )
            : GridView.builder(
                itemCount: length,
                controller: controller,
                padding: padding,
                shrinkWrap: noScroll ?? false,
                physics: noScroll ?? false ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossCount!,
                  childAspectRatio: aspect!,
                  crossAxisSpacing: crossSpacing!,
                  mainAxisSpacing: mainSpacing!,
                ),
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
                },
              ));
  }
}
