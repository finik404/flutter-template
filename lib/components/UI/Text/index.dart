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
  final bool? isWrap;

  // Props ----------------
  const CText(
    this.text, {
    this.size,
    this.weight,
    this.color,
    this.style,
    this.align,
    this.lines,
    this.height,
    this.isWrap,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    Color customColor = color ?? AppColors.white;
    Widget content = Text(
      text,
      maxLines: lines,
      overflow: lines != null ? TextOverflow.ellipsis : null,
      textAlign: align,
      style: TextStyle(
        fontSize: size ?? 16,
        fontWeight: weight ?? FontWeight.normal,
        color: customColor,
        decorationColor: customColor,
        height: height,
      ).merge(style),
    );

    return isWrap == true
        ? Flexible(child: Wrap(children: [content]))
        : content;
  }
}
