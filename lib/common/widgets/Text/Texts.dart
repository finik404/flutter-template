// import 'package:flutter/gestures.dart';
// import 'package:flutter/material.dart';
//
// class UITexts extends StatelessWidget {
//   const UITexts(
//     this.children, {
//     super.key,
//     this.size,
//     this.color,
//     this.weight,
//     this.linkColor,
//     this.lineHeight,
//     this.align,
//   });
//
//   final List<dynamic> children;
//   final double? size, lineHeight;
//   final FontWeight? weight;
//   final Color? color, linkColor;
//   final TextAlign? align;
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     List<InlineSpan> textSpans = [];
//
//     for (var child in children) {
//       if (child is String) {
//         textSpans.add(TextSpan(text: child));
//       } else if (child is Map<String, dynamic>) {
//         if (!(child['show'] ?? true)) {
//           continue;
//         }
//
//         String text = child['text'] ?? '';
//         double? childSize = child['size'];
//         Color? childColor = child['color'];
//         FontWeight? childWeight = child['weight'];
//         double? childHeight = child['height'];
//         Widget? screen = child['screen'];
//         String? webLink = child['webLink'];
//         Function? onTap = child['onTap'];
//
//         if (screen != null || webLink != null || onTap != null) {
//           // Link text
//           textSpans.add(
//             TextSpan(
//               text: text,
//               style: TextStyle(
//                 fontSize: childSize ?? size,
//                 color: childColor ?? linkColor ?? TColors.blue,
//                 fontWeight: childWeight ?? weight,
//                 height: childHeight,
//               ),
//               recognizer: TapGestureRecognizer()
//                 ..onTap = () async {
//                   if (webLink != null) {
//                     await launchUrl(Uri.parse(webLink));
//                   } else if (onTap != null) {
//                     onTap();
//                   } else if (screen != null) {
//                     Navigator.push(context, MaterialPageRoute(builder: (context) => screen));
//                   }
//                 },
//             ),
//           );
//         } else {
//           textSpans.add(TextSpan(
//             text: text,
//             style: TextStyle(fontSize: childSize ?? size, color: childColor ?? customColor, fontWeight: childWeight ?? weight, height: childHeight),
//           ));
//         }
//       }
//     }
//
//     // Texts
//     return RichText(
//       textAlign: align ?? TextAlign.start,
//       text: TextSpan(
//         style: TextStyle(fontSize: size, color: color, fontWeight: weight, height: lineHeight),
//         children: textSpans,
//       ),
//     );
//   }
// }
