import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/constants/colors.dart';

/*
  TextLink Component ----------------
 */
class TextLink extends StatelessWidget {
  // Variables ----------------
  final String text;
  final String? link;
  final Function()? func;
  final String? webLink;
  final TextStyle? style;
  final MainAxisAlignment? align;
  final double? size;
  final Color? color;

  // Props ----------------
  const TextLink(
    this.text, {
    this.link,
    this.func,
    this.webLink,
    this.size,
    this.color,
    this.align = MainAxisAlignment.start,
    this.style,
    super.key,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          link ?? Navigator.pushNamed(context, link!);
          func ?? () => func;
          if (webLink != null) {
            Uri url = Uri.parse(webLink!);
            () => launchUrl(url);
          }
        },
        child: Row(
          mainAxisAlignment: align ?? MainAxisAlignment.start,
          children: [
            CText(text,
                color: color ?? AppColors.blue, size: size, style: style),
          ],
        ));
  }
}
