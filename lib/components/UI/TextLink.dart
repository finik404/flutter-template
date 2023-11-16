import 'package:flutter/material.dart';
import 'package:flutter_letmetalk/components/UI/Text.dart';
import 'package:flutter_letmetalk/constants/colors.dart';

/*
  TextLink Component ----------------
 */
class TextLink extends StatelessWidget {
  // Variables ----------------
  final String text;
  final String link;
  final TextStyle? style;
  final MainAxisAlignment? align;
  final double? size;

  // Props ----------------
  const TextLink(
    this.text,
    this.link, {
    Key? key,
    this.align = MainAxisAlignment.start,
    this.size,
    this.style,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: () {
          Navigator.pushNamed(context, link);
        },
        child: Row(
          mainAxisAlignment: align ?? MainAxisAlignment.start,
          children: [
            CText(
              text,
              color: AppColors.blue,
              size: size,
              style: style,
            ),
          ],
        ));
  }
}
