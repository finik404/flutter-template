import 'package:flutter/material.dart';
import 'package:tproject/common/layouts/base.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/extensions/media.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.child,
    required this.title,
    this.text,
    this.textWidget,
  });

  final Widget child;
  final String title;
  final String? text;
  final Widget? textWidget;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          SizedBox(
            width: (context.screenWidth - 40) * 0.9,
            child: UIText(title, weight: FontWeight.bold, size: 24),
          ),
          const SizedBox(height: 18),

          // Text
          if (text != null || textWidget != null)
            Container(
              margin: const EdgeInsets.only(bottom: 35),
              width: (context.screenWidth - 40) * 0.8,
              child: textWidget ?? UIText(text!, size: 18),
            ),

          // Content
          child,
        ],
      ),
    );
  }
}
