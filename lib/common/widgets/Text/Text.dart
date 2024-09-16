import 'package:flutter/material.dart';
import 'package:tproject/util/constants/options.dart';
import 'package:tproject/util/constants/styles.dart';

class UIText extends StatelessWidget {
  const UIText(
    this.text, {
    super.key,
    this.size,
    this.weight,
    this.color,
    this.styles,
    this.align,
    this.lineHeight,
    this.isOverflow,
    this.lines,
    this.isDecoration,
  });

  final String text;
  final double? size, lineHeight;
  final FontWeight? weight;
  final Color? color;
  final TextStyle? styles;
  final TextAlign? align;
  final bool? isOverflow, isDecoration;
  final int? lines;

  @override
  Widget build(BuildContext context) {
    bool isCropped = isOverflow == true || lines != null;

    // Default styles
    TextStyle textStyles = TOptions.textStyles;

    // Styles
    TextStyle textStyle = textStyles.copyWith(
      fontFamily: TStyles.font,
      fontSize: size ?? textStyles.fontSize,
      fontWeight: weight ?? textStyles.fontWeight,
      color: color ?? textStyles.color,
      height: lineHeight ?? textStyles.height,
      decoration: isDecoration == true ? TextDecoration.underline : TextDecoration.none,
      decorationColor: isDecoration == true ? (color ?? textStyles.color) : null,
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
