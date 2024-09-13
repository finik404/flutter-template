import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tproject/util/constants/options.dart';

class UISkeleton extends StatelessWidget {
  const UISkeleton({
    super.key,
    required this.width,
    this.height = TOptions.skeletonHeight,
    this.radius = TOptions.skeletonRadius,
  });

  final double width;
  final double height;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: TOptions.skeletonColor1,
      highlightColor: TOptions.skeletonColor2,
      child: Container(
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(radius),
        ),
      ),
    );
  }
}
