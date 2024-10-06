import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:tproject/common/widgets/Refresh.dart';
import 'package:tproject/util/options/grid.dart';

class UIGrid extends StatelessWidget {
  const UIGrid({
    super.key,
    required this.length,
    required this.child,
    this.crossCount = TGridOptions.crossCount,
    this.spaceBetween = TGridOptions.spaceBetween,
    this.spaceBottom = TGridOptions.spaceBottom,
    this.hasScroll = TGridOptions.hasScroll,
    this.padding = TGridOptions.padding,
    this.controller,
    this.refresh,
  });

  final int length;
  final dynamic child;
  final int crossCount;
  final double spaceBetween, spaceBottom;
  final bool hasScroll;
  final EdgeInsetsGeometry padding;
  final ScrollController? controller;
  final Future<void> Function()? refresh;

  @override
  Widget build(BuildContext context) {
    // With dynamic height elements
    Widget grid = AlignedGridView.count(
      itemCount: length,
      controller: controller,
      padding: padding,

      // Options grid
      crossAxisCount: crossCount,
      crossAxisSpacing: spaceBetween,
      mainAxisSpacing: spaceBottom,

      // No scroll
      shrinkWrap: !hasScroll,
      physics: !hasScroll ? const NeverScrollableScrollPhysics() : const AlwaysScrollableScrollPhysics(),

      // Items
      itemBuilder: (context, index) {
        if (child is Widget Function(int)) {
          return child(index);
        } else {
          return child;
        }
      },
    );

    // Grid with refresh indicator
    return refresh != null ? UIRefresh(refresh: refresh!, child: grid) : grid;
  }
}
