// import 'package:flutter/material.dart';
//
// class ActionMenu extends StatelessWidget {
//   const ActionMenu({
//     super.key,
//   });
//
//   String? label;
//   List<TAction>? actions;
//   Widget? content;
//   bool? hasScroll;
//   double? height;
//   double? topMargin;
//   EdgeInsets? padding;
//
//   @override
//   Widget build(BuildContext context) {
//     Widget childInside = Padding(
//         padding: padding ?? EdgeInsets.fromLTRB(15, topMargin ?? 24, 15, 24),
//         child: actions != null
//             ? CList(
//                 noScroll: true,
//                 length: actions.length,
//                 child: (index) {
//                   return actions[index].isShow == null || actions[index].isShow == true
//                       ? Material(
//                           color: Colors.transparent,
//                           child: ClickArea(
//                             onTap: () {
//                               if (actions[index].func != null) {
//                                 actions[index].func!();
//                                 if (actions[index].noPop == null) Navigator.pop(context);
//                               } else if (actions[index].screen != null) {
//                                 Navigator.pop(context);
//                                 navigate(context, actions[index].screen!);
//                               }
//                             },
//                             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
//                             child: Row(
//                               children: [
//                                 CIcon(actions[index].icon, weight: FontWeight.normal, size: 18),
//                                 const SizedBox(width: 20),
//                                 Expanded(child: CText(actions[index].label, size: 16))
//                               ],
//                             ),
//                           ),
//                         )
//                       : Container();
//                 },
//               )
//             : content!);
//
//     Widget child = Stack(clipBehavior: Clip.none, children: [
//       Container(
//         decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: context.theme.primaryContainer),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisSize: MainAxisSize.min,
//           children: [
//             // Title
//             if (actions != null || label != null)
//               Padding(
//                   padding: const EdgeInsets.symmetric(horizontal: 15),
//                   child: Container(
//                       width: context.screenWidth,
//                       padding: const EdgeInsets.all(10),
//                       decoration: BoxDecoration(
//                           border: Border(
//                         bottom: BorderSide(width: 1, color: context.theme.primary.withOpacity(0.1)),
//                       )),
//                       child: CText(
//                         label ?? S.of(context).action,
//                         size: 14,
//                         color: context.theme.secondary,
//                         align: TextAlign.center,
//                       ))),
//
//             // Actions
//             hasScroll == true ? Expanded(child: SingleChildScrollView(child: childInside)) : childInside,
//           ],
//         ),
//       ),
//
//       // Indicator
//       Positioned(
//         top: -10,
//         left: context.screenWidth / 2 - 75 / 2,
//         child: Container(
//           width: 75,
//           height: 4,
//           decoration: BoxDecoration(borderRadius: BorderRadius.circular(6), color: context.theme.primary.withOpacity(0.3)),
//         ),
//       )
//     ]);
//
//     return hasScroll == true ? FractionallySizedBox(heightFactor: height ?? 0.7, child: child) : child;
//   }
// }
