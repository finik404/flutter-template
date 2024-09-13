// import 'dart:ui';
// import 'package:flutter/material.dart';
// import 'package:flutter_widget_from_html_core/flutter_widget_from_html_core.dart';
// import 'package:url_launcher/url_launcher.dart';
//
// /*
//   HTMLtoText Component ----------------
//  */
// class HTMLtoText extends StatelessWidget {
//   // Variables ----------------
//   final String text;
//   final double? size;
//   final FontWeight? weight;
//   final double? height;
//   final Color? color;
//   final Color? linkColor;
//
//   // Props ----------------
//   const HTMLtoText(
//       this.text, {
//         this.size,
//         this.weight,
//         this.height,
//         this.color,
//         this.linkColor,
//         super.key,
//       });
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     return HtmlWidget(
//       text,
//       textStyle: TextStyle(
//         fontSize: size ?? 16,
//         fontWeight: weight ?? FontWeight.normal,
//         height: height,
//         color: color,
//       ),
//       customStylesBuilder: (element) {
//         if (element.localName == 'a') {
//           return {'color': '#5468FE', 'text-decoration': 'none'};
//         }
//         return null;
//       },
//       onTapUrl: (url) => launchUrl(Uri.parse(url)),
//     );
//   }
// }