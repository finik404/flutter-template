// import 'package:b2c/config/constants/colors/colors.dart';
// import 'package:b2c/core/models/base.dart';
// import 'package:b2c/core/widgets/UI/_exports.dart';
// import 'package:flutter/material.dart';
//
// /*
//   Select Component ----------------
//  */
// class Select extends StatelessWidget {
//   // Variables ----------------
//   final String label;
//   final List<SelectItem> items;
//   final SelectItem value;
//   final Function(SelectItem value) onChange;
//
//   // Props ----------------
//   const Select(
//       this.label,
//       this.items, {
//         required this.value,
//         required this.onChange,
//         super.key,
//       });
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//         child: Stack(clipBehavior: Clip.none, children: [
//           Container(
//               padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
//               decoration: BoxDecoration(
//                   borderRadius: TStyles.br,
//                   border: Border.all(width: 1, color: TColors.main.withOpacity(0.3))),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CText(value.label),
//                   CIcon(TIcons.down, color: TColors.main, size: 16)
//                 ],
//               )),
//           Positioned(
//             top: -10,
//             left: 15,
//             child: Container(
//                 padding: const EdgeInsets.symmetric(horizontal: 5),
//                 color: TColors.white,
//                 child: CText(
//                   label,
//                   color: TColors.main.withOpacity(0.5),
//                   size: 14,
//                 )),
//           )
//         ]),
//         onTap: () => openPopup(context, Popup(label: label, items: items, value: value, onChange: onChange)));
//   }
// }