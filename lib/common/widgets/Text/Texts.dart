import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:talktime/config/constants/colors.dart';
import 'package:url_launcher/url_launcher.dart';

/*
  Texts Component ----------------
 */
class Texts extends StatelessWidget {
  // Variables ----------------
  final List<dynamic> children;
  final double? size;
  final FontWeight? weight;
  final Color? color;
  final Color? linkColor;
  final TextAlign? align;
  final double? height;

  // Props ----------------
  const Texts(
    this.children, {
    super.key,
    this.size = 16,
    this.weight = FontWeight.normal,
    this.color,
    this.linkColor,
    this.align,
    this.height,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    List<InlineSpan> textSpans = [];
    Color customColor = color ?? AppColors.black;

    for (var child in children) {
      if (child is String) {
        textSpans.add(TextSpan(text: child));
      } else if (child is Map<String, dynamic>) {
        if (!(child['show'] ?? true)) {
          continue;
        }

        String text = child['text'] ?? '';
        double? childSize = child['size'];
        Color? childColor = child['color'];
        FontWeight? childWeight = child['weight'];
        double? childHeight = child['height'];
        Widget? screen = child['screen'];
        String? webLink = child['webLink'];
        Function? onTap = child['onTap'];

        if (screen != null || webLink != null || onTap != null) {
          // Link text
          textSpans.add(
            TextSpan(
              text: text,
              style: TextStyle(
                fontSize: childSize ?? size,
                color: childColor ?? linkColor ?? AppColors.blue,
                fontWeight: childWeight ?? weight,
                height: childHeight,
              ),
              recognizer: TapGestureRecognizer()
                ..onTap = () async {
                  if (webLink != null) {
                    await launchUrl(Uri.parse(webLink));
                  } else if (onTap != null) {
                    onTap();
                  } else if (screen != null) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
                  }
                },
            ),
          );
        } else {
          textSpans.add(TextSpan(
            text: text,
            style: TextStyle(fontSize: childSize ?? size, color: childColor ?? customColor, fontWeight: childWeight ?? weight, height: childHeight),
          ));
        }
      }
    }

    return RichText(
      textAlign: align ?? TextAlign.start,
      text: TextSpan(
        style: TextStyle(fontSize: size, color: customColor, fontWeight: weight, height: height),
        children: textSpans,
      ),
    );
  }
}
