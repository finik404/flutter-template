import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:tproject/util/options/skeleton.dart';

class UISkeleton extends StatelessWidget {
  const UISkeleton({
    super.key,
    this.width,
    this.height = TSkeletonOptions.height,
    this.radius = TSkeletonOptions.radius,
  });

  final double? width;
  final double height, radius;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: TSkeletonOptions.color1,
      highlightColor: TSkeletonOptions.color2,
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
