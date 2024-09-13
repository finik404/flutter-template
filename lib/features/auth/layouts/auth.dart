import 'package:flutter/material.dart';
// import 'package:wordwise/core/_exports.dart';
// import 'package:wordwise/features/auth/widgets/AuthLogo.dart';

/*
  Auth Layout ----------------
 */
class AuthLayout extends StatelessWidget {
  // Variables ----------------
  final String label;
  final List<Widget> children;
  final String? text;
  final Widget? textWidget;
  final bool? isAuth;
  final double? labelWidth;
  final double? textWidth;

  // Props ----------------
  const AuthLayout({
    super.key,
    required this.label,
    required this.children,
    this.text,
    this.textWidget,
    this.isAuth,
    this.labelWidth,
    this.textWidth,
  });

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    Widget content = Column(mainAxisAlignment: MainAxisAlignment.center, crossAxisAlignment: CrossAxisAlignment.start, children: [
      // // Logo
      // if (isAuth == true) const AuthLogo(),
      //
      // // Label
      // SizedBox(width: (context.screenWidth - 40) * (labelWidth ?? 0.9), child: CText(label, weight: FontWeight.bold, size: 28)),
      // const SizedBox(height: 18),
      // SizedBox(width: (context.screenWidth - 40) * (textWidth ?? 0.8), child: textWidget ?? CText(text!, color: context.textColor)),
      // const SizedBox(height: 35),

      // Content
      Column(crossAxisAlignment: CrossAxisAlignment.start, children: children),
      const SizedBox(height: 15),
    ]);

    return Scaffold(
        body: SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18),
        child: isAuth == true
            // Auth screen layout
            ? Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Container(),
                content,
              ])

            // Other screens layout
            : Stack(
                children: [
                  // Positioned(top: 12, child: IconBtn(TIcons.left_long, onTap: () => Navigator.pop(context))),
                  Center(child: Padding(padding: const EdgeInsets.only(top: 50), child: SingleChildScrollView(child: content)))
                ],
              ),
      ),
    ));
  }
}
