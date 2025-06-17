import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Buttons/Button.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/languages/L.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';
import 'package:tproject/util/extensions/media.dart';

class UIConfirm extends StatelessWidget {
  const UIConfirm(
    this.title, {
    super.key,
    this.text,
    this.width,
    this.close,
  });

  final String title;
  final String? text;
  final double? width;
  final Function()? close;

  @override
  Widget build(BuildContext context) {
    // Themes
    ElevatedButtonThemeData closeButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(15),
        backgroundColor: const Color(0xFFCECECE),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        shadowColor: Colors.transparent,
      ),
    );

    ElevatedButtonThemeData confirmButtonTheme = ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        elevation: 0,
        padding: const EdgeInsets.all(15),
        backgroundColor: TColors.secondary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        textStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        shadowColor: Colors.transparent,
      ),
    );

    // Content

    return Center(
      child: Container(
        width: width ?? context.sWidth * 0.85,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(TStyles.radius), color: TColors.white),
        padding: TStyles.pd,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (text == null)
              Padding(
                padding: const EdgeInsets.only(bottom: 15),
                child: Row(
                  children: [
                    Container(
                      width: 26,
                      height: 26,
                      decoration: const BoxDecoration(color: TColors.secondary, shape: BoxShape.circle),
                      padding: const EdgeInsets.only(bottom: 2),
                      child: UIIcon(
                        FontAwesomeIcons.info,
                        // color: context.colorInvert,
                        size: 12,
                      ),
                    ),
                    const SizedBox(width: 12),
                    UIText(L.of(context).confirmation, weight: FontWeight.bold),
                  ],
                ),
              ),

            // Title
            UIText(title, weight: text != null ? FontWeight.bold : FontWeight.normal),
            SizedBox(height: text != null ? 15 : 30),

            // Text
            if (text != null)
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UIText(
                    text!,
                    size: 14,
                    // color: context.gray,
                  ),
                  const SizedBox(height: 35),
                ],
              ),

            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: ((context.sWidth * 0.85) - 10 - 50) * 0.5,
                  child: UIButton(
                    L.of(context).close,
                    () => Navigator.pop(context),
                    styles: closeButtonTheme.style,
                  ),
                ),
                SizedBox(
                  width: ((context.sWidth * 0.85) - 10 - 50) * 0.5,
                  child: UIButton(
                    L.of(context).confirm,
                    () {
                      if (close != null) close!();
                      Navigator.pop(context);
                    },
                    styles: confirmButtonTheme.style,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
