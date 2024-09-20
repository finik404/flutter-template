import 'package:flutter/material.dart';
import 'package:tproject/common/layouts/base.dart';
import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/extensions/media.dart';
import 'package:tproject/util/helpers/device.dart';

class AuthLayout extends StatelessWidget {
  const AuthLayout({
    super.key,
    required this.child,
    required this.title,
    this.text,
    this.textWidget,
    required this.errors,
    this.hasArrow = true,
  });

  final Widget child;
  final String title;
  final String? text;
  final Widget? textWidget;
  final String errors;
  final bool hasArrow;

  @override
  Widget build(BuildContext context) {
    return BaseLayout(
      // Header
      appBar: hasArrow
          ? AppBar(
              toolbarHeight: 62,
              leading: Container(
                margin: EdgeInsets.only(left: 20, top: TDevice.statusBarHeight()),
                child: UIIconButton(TIcons.left, () => Navigator.pop(context)),
              ),
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
          const SizedBox(height: 18),

          // Text
          if (text != null || textWidget != null)
            Container(
              margin: const EdgeInsets.only(bottom: 35),
              child: textWidget ?? UIText(text!, size: 18),
            ),

          // Errors
          if (errors.isNotEmpty)
            Container(
              margin: const EdgeInsets.only(top: 10, bottom: 25),
              child: UIText(errors, size: 14, color: TColors.error),
            ),

          // Content
          child,
        ],
      ),
    );
  }
}
