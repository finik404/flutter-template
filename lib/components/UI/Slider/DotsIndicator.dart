import 'package:flutter/material.dart';
import 'dart:math';

import 'package:template/constants/colors.dart';

class DotsIndicator extends AnimatedWidget {
  final PageController controller;
  final int itemCount;
  final Color? color;
  final Color? selectedColor;

  const DotsIndicator({
    required this.controller,
    required this.itemCount,
    this.color,
    this.selectedColor,
    super.key,
  }) : super(listenable: controller);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(itemCount, (index) {
        double selectedNess = Curves.easeOut.transform(max(0.0,
            1.0 - ((controller.page ?? controller.initialPage) - index).abs()));
        double width = selectedNess * 12.0 + 4.0;

        return Container(
          width: width,
          height: 4,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50),
            color: Color.lerp(
                AppColors.blue.withOpacity(0.5), AppColors.blue, selectedNess),
          ),
        );
      }),
    );
  }
}
