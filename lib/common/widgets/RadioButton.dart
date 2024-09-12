// import 'package:flutter/material.dart';
//
// class UIRadioButton extends StatelessWidget {
//   const UIRadioButton(
//     this.value, {
//     this.isSelect = false,
//     super.key,
//   });
//
//   final bool value;
//   final bool isSelect;
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     Color color = context.theme.secondary;
//     Color activeColor = context.theme.primary;
//
//     // if (!isSelect) {
//     //   color = context.theme.primary;
//     //   activeColor = context.primaryColor;
//     // } else if (isSelect && context.isDark) {
//     //   activeColor = context.primaryColor;
//     // }
//
//     return Stack(
//       children: [
//         Container(
//           width: 15,
//           height: 15,
//           decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(width: 1, color: value ? activeColor : color)),
//         ),
//         if (value)
//           Positioned(
//             top: 5,
//             left: 5,
//             child: Container(
//               width: 5,
//               height: 5,
//               decoration: BoxDecoration(shape: BoxShape.circle, color: activeColor),
//             ),
//           )
//       ],
//     );
//   }
// }
