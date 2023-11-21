import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  CText Component ----------------
 */
class CText extends StatelessWidget {
  // Variables ----------------
  final String text;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final TextStyle? style;
  final TextOverflow? overflow;

  // Props ----------------
  const CText(
    this.text, {
    Key? key,
    this.size = 16,
    this.weight = FontWeight.normal,
    this.color = AppColors.black,
    this.style,
    this.overflow,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      overflow: overflow,
      style: TextStyle(fontSize: size, fontWeight: weight, color: color)
          .merge(style),
    );
  }
}
