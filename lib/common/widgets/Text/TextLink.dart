// import 'package:flutter/material.dart';
// import 'package:talktime/core/extensions/theme.dart';
// import 'package:talktime/core/widgets/UI/ClickArea.dart';
// import 'package:talktime/core/widgets/UI/Text/Text.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// /*
//   TextLink Component ----------------
//  */
// class TextLink extends StatelessWidget {
//   // Variables ----------------
//   final String text;
//   final Widget? screen;
//   final Function()? onTap;
//   final String? webLink;
//   final TextStyle? style;
//   final MainAxisAlignment? align;
//   final double? size;
//   final Color? color;
//   final EdgeInsets? padding;
//
//   // Props ----------------
//   const TextLink(
//     this.text, {
//     super.key,
//     this.screen,
//     this.onTap,
//     this.webLink,
//     this.size,
//     this.color,
//     this.align = MainAxisAlignment.start,
//     this.style,
//     this.padding,
//   });
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     Text
//
//     return Row(children: [
//       ClickArea(
//           borderRadius: BorderRadius.circular(5),
//           padding: padding ?? const EdgeInsets.symmetric(horizontal: 5),
//           onTap: () {
//             if (screen != null) Navigator.push(context, MaterialPageRoute(builder: (context) => screen!));
//             if (onTap != null) onTap!();
//             if (webLink != null) {
//               Uri url = Uri.parse(webLink!);
//               () => launchUrl(url);
//             }
//           },
//           child: Row(
//             mainAxisSize: MainAxisSize.min,
//             mainAxisAlignment: align ?? MainAxisAlignment.start,
//             children: [
//               CText(
//                 text,
//                 color: color ?? context.primaryColor,
//                 size: size,
//                 style: style,
//               ),
//             ],
//           )),
//     ]);
//   }
// }
