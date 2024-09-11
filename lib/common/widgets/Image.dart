// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:flutter/material.dart';
// import 'package:talktime/config/constants/colors.dart';
// import 'package:talktime/config/constants/styles.dart';
// import 'package:talktime/core/extensions/media.dart';
// import 'package:talktime/core/widgets/UI/Text/Text.dart';
// import 'package:talktime/features/settings/extensions/Text.dart';
//
// /*
//   CardImage Component ----------------
//  */
// class CImage extends StatelessWidget {
//   // Variables ----------------
//   final String? image;
//   final String name;
//   final double width;
//
//   // Props ----------------
//   const CImage(
//     this.image, {
//     super.key,
//     required this.name,
//     required this.width,
//   });
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     return ClipRRect(
//       borderRadius: Styles.br,
//       child: image != null
//           ? Stack(children: [
//               Container(width: width, height: width, color: AppColors.white),
//               CachedNetworkImage(
//                 imageUrl: image!,
//                 fit: BoxFit.cover,
//                 width: width,
//                 height: width,
//                 maxHeightDiskCache: 300,
//                 maxWidthDiskCache: 300,
//                 fadeInCurve: Curves.easeIn,
//                 fadeInDuration: const Duration(milliseconds: 150),
//                 fadeOutCurve: Curves.easeOut,
//                 fadeOutDuration: const Duration(milliseconds: 200),
//               )
//             ])
//           : Container(
//               width: width,
//               height: width,
//               decoration: BoxDecoration(color: AppColors.white, borderRadius: Styles.br),
//               child: Center(child: CText(name.substring(0, 1).toUpperCase(), size: context.isCS ? 40 : 75, weight: FontWeight.bold)),
//             ),
//     );
//   }
// }
