import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:tproject/util/constants/options.dart';

class UITexts extends StatelessWidget {
  const UITexts(
    this.children, {
    super.key,
    this.styles,
    this.size,
    this.color,
    this.weight,
    this.linkColor = TOptions.textsLinkColor,
    this.linkHasDecoration = TOptions.textsLinkHasDecoration,
    this.lineHeight,
    this.align = TextAlign.start,
  });

  final List<TextModel> children;
  final double? size, lineHeight;
  final TextStyle? styles;
  final FontWeight? weight;
  final Color? color, linkColor;
  final TextAlign align;
  final bool linkHasDecoration;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpans = [];

    // Default styles
    TextStyle textStyles = styles ?? TOptions.textStyles;

    // Children
    for (var child in children) {
      // isShow
      if (!(child.isShow)) continue;

      // Link text element
      if (child.onTap != null) {
        textSpans.add(
          TextSpan(
            text: child.text,
            style: child.styles ??
                TextStyle(
                  fontSize: child.size,
                  color: child.color ?? linkColor,
                  fontWeight: child.weight,
                  height: child.lineHeight,
                  decoration: linkHasDecoration ? TextDecoration.underline : TextDecoration.none,
                  decorationColor: linkHasDecoration ? (child.color ?? linkColor) : null,
                ),
            recognizer: TapGestureRecognizer()..onTap = () => child.onTap!(),
          ),
        );
      }

      // Default text element
      else {
        textSpans.add(
          TextSpan(
            text: child.text,
            style: child.styles ?? TextStyle(fontSize: child.size, color: child.color, fontWeight: child.weight, height: child.lineHeight),
          ),
        );
      }
    }

    // Texts
    return RichText(
      textAlign: align,
      text: TextSpan(
        style: TextStyle(
          fontSize: size ?? textStyles.fontSize,
          color: color ?? textStyles.color,
          fontWeight: weight ?? textStyles.fontWeight,
          height: lineHeight ?? textStyles.height,
        ),
        children: textSpans,
      ),
    );
  }
}

class TextModel {
  final String text;
  final TextStyle? styles;
  final Color? color;
  final double? size, lineHeight;
  final FontWeight? weight;
  final Function()? onTap;
  final bool isShow;

  TextModel(
    this.text, {
    this.styles,
    this.color,
    this.size,
    this.lineHeight,
    this.weight,
    this.onTap,
    this.isShow = true,
  });
}
