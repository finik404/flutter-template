import 'package:flutter/material.dart';

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
    TextStyle defaultStyles = Theme.of(context).textTheme.bodyMedium!;

    // Styles
    TextStyle textStyle = defaultStyles.copyWith(
      fontSize: size ?? defaultStyles.fontSize,
      fontWeight: weight ?? defaultStyles.fontWeight,
      color: color ?? defaultStyles.color,
      height: lineHeight ?? defaultStyles.height,
      decoration: isDecoration == true ? TextDecoration.underline : null,
      decorationColor: isDecoration == true ? (color ?? defaultStyles.color) : null,
    );

    return Text(
      text,
      style: textStyle.merge(styles),
      textAlign: align,
      maxLines: lines,
      overflow: isCropped ? TextOverflow.ellipsis : null,
    );
  }
}
