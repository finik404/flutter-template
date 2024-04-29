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
  final int? lines;
  final TextAlign? align;
  final double? height;

  // Props ----------------
  const CText(
    this.text, {
    this.size = 16,
    this.weight = FontWeight.normal,
    this.color = AppColors.black,
    this.style,
    this.align,
    this.lines,
    this.height,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: lines,
      overflow: lines != null ? TextOverflow.ellipsis : null,
      textAlign: align,
      style: TextStyle(
        fontSize: size,
        fontWeight: weight,
        color: color,
        decorationColor: color,
        height: height,
      ).merge(style),
    );
  }
}