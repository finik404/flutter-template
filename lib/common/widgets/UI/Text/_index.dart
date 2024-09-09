import 'package:flutter/material.dart';
import 'package:talktime/config/constants/colors.dart';
import 'package:talktime/config/constants/styles.dart';

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
  final bool? isOverflow;
  final bool? isDecoration;
  final int? lines;
  final TextAlign? align;
  final double? height;
  final bool? isWrap;

  // Props ----------------
  const CText(
    this.text, {
    super.key,
    this.size = 16,
    this.weight = FontWeight.normal,
    this.color,
    this.style,
    this.isOverflow,
    this.align,
    this.lines,
    this.isDecoration,
    this.height,
    this.isWrap,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    Color customColor = color ?? AppColors.black;
    Widget content = Text(
      text,
      maxLines: lines,
      overflow: isOverflow == true || lines != null ? TextOverflow.ellipsis : null,
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
