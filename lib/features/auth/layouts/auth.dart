import 'package:flutter/material.dart';
import 'package:tproject/common/layouts/base.dart';
import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/extensions/media.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.child,
    required this.title,
    this.text,
    this.textWidget,
    this.hasArrow = true,
  });

  final Widget child;
  final String title;
  final String? text;
  final Widget? textWidget;
  final bool hasArrow;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      // Header
      appHeight: hasArrow ? 50 : 0,
      hasAppBar: true,
      leadingWidth: 70,
      leading: hasArrow
          ? Container(
              margin: const EdgeInsets.only(left: 20),
              child: UIIconButton(TIcons.left, () => Navigator.pop(context)),
            )
          : null,

      // Content
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          SizedBox(
            width: (context.screenWidth - 40) * 0.9,
            child: UIText(title, weight: FontWeight.bold, size: 24),
          ),
          const SizedBox(height: 12),

          // Text
          if (text != null || textWidget != null)
            Container(
              margin: const EdgeInsets.only(bottom: 35),
              child: textWidget ?? UIText(text!, size: 18),
            ),

          // Content
          child,
        ],
      ),
    );
  }
}
