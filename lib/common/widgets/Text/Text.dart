import 'package:flutter/material.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/options/text.dart';

class UIText extends StatelessWidget {
  const UIText(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.styles,
    this.align = TextAlign.start,
    this.lineHeight,
    this.isOverflow = false,
    this.lines,
    this.isDecoration = false,
  });

  final String text;
  final double? size, lineHeight;
  final FontWeight? weight;
  final Color? color;
  final TextStyle? styles;
  final TextAlign align;
  final bool isOverflow, isDecoration;
  final int? lines;

  @override
  Widget build(BuildContext context) {
    bool isCropped = isOverflow || lines != null;

    // Default styles
    TextStyle textStyles = TTextOptions.styles;

    // Styles
    TextStyle textStyle = textStyles.copyWith(
      fontFamily: TStyles.font,
      fontSize: size ?? textStyles.fontSize,
      fontWeight: weight ?? textStyles.fontWeight,
      color: color ?? textStyles.color,
      height: lineHeight ?? textStyles.height,
      decoration: isDecoration ? TextDecoration.underline : TextDecoration.none,
      decorationColor: isDecoration ? (color ?? textStyles.color) : null,
    );

    return Text(
      text,
      style: textStyle.merge(styles),
      textAlign: align,
      maxLines: lines,
      overflow: isCropped ? TextOverflow.ellipsis : TextOverflow.clip,
    );
  }
}
