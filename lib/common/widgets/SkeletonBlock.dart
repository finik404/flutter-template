import 'package:flutter/material.dart';

/*
  SkeletonBlock Component ----------------
 */
class SkeletonBlock extends StatelessWidget {
  // Variables ----------------
  final double? height;
  final dynamic width;
  final double? radius;

  // Props ----------------
  const SkeletonBlock({
    super.key,
    this.height,
    this.width,
    this.radius,
  });

  @override
  Widget build(BuildContext context) {
    // Width is %
    if (width is String && width.contains('%')) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final widthPercentage = double.tryParse(width.replaceAll('%', '')) ?? 100;
          final calculatedWidth = constraints.maxWidth * (widthPercentage / 100);
          return buildContainer(calculatedWidth);
        },
      );
    }

    // Width is int
    double? calculatedWidth = width is double || width is int ? width.toDouble() : null;
    return buildContainer(calculatedWidth);
  }

  // Container
  Widget buildContainer(double? width) {
    return Container(
      width: width,
      height: height ?? 18,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(radius ?? 10),
      ),
    );
  }
}
