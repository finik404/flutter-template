import 'package:flutter/material.dart';

/*
  LoadingBlock Component ----------------
 */
class LoadingBlock extends StatelessWidget {
  // Variables ----------------
  final double? height;
  final dynamic width;
  final double? radius;

  // Props ----------------
  const LoadingBlock({
    this.height,
    this.width,
    this.radius,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // Если width является строкой и содержит '%', используем LayoutBuilder
    if (width is String && width.contains('%')) {
      return LayoutBuilder(
        builder: (context, constraints) {
          final widthPercentage =
              double.tryParse(width.replaceAll('%', '')) ?? 100;
          final calculatedWidth =
              constraints.maxWidth * (widthPercentage / 100);
          return buildContainer(calculatedWidth);
        },
      );
    }

    // Если width является double или int, просто строим контейнер
    double? calculatedWidth =
        width is double || width is int ? width.toDouble() : null;
    return buildContainer(calculatedWidth);
  }

  // Строим контайнер
  Widget buildContainer(double? width) {
    return Container(
      width: width,
      height: height ?? 18,
      decoration: BoxDecoration(
        color: Colors.grey[350],
        borderRadius: BorderRadius.circular(radius ?? 6),
      ),
    );
  }
}
