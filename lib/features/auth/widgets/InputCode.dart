// import 'package:flutter/material.dart';
// import 'package:wordwise/config/constants/themes.dart';
// import 'package:wordwise/extensions/theme.dart';
//
// /*
//   InputCode Component ----------------
//  */
// class InputCode extends StatefulWidget {
//   // Variables ----------------
//   final Function(String) change;
//   final Function(String) submit;
//
//   // Props ----------------
//   const InputCode({
//     super.key,
//     required this.change,
//     required this.submit,
//   });
//
//   // Builder ----------------
//   @override
//   InputCodeState createState() => InputCodeState();
// }
//
// /*
//   State Component ----------------
//  */
// class InputCodeState extends State<InputCode> {
//   // Variables ----------------
//   late List<TextEditingController> controllers;
//   late List<FocusNode> focusNodes;
//
//   // InitState ----------------
//   @override
//   void initState() {
//     super.initState();
//     controllers = List.generate(4, (_) => TextEditingController());
//     focusNodes = List.generate(4, (_) => FocusNode());
//   }
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: List.generate(4, (index) {
//         return Container(
//           width: 65,
//           height: 65,
//           decoration: BoxDecoration(color: context.theme.primaryContainer, borderRadius: Styles.br, boxShadow: context.shadow),
//           child: TextField(
//             controller: controllers[index],
//             focusNode: focusNodes[index],
//             keyboardType: TextInputType.number,
//             textAlign: TextAlign.center,
//             maxLength: 1,
//             autofocus: index == 0,
//             textInputAction: index < 3 ? TextInputAction.next : TextInputAction.done,
//             decoration: InputDecoration(
//               hintText: '0',
//               hintStyle: TextStyle(color: context.theme.secondary),
//               counterText: '',
//               contentPadding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
//               border: InputBorder.none,
//               enabledBorder: InputBorder.none,
//               focusedBorder: InputBorder.none,
//               errorBorder: InputBorder.none,
//               disabledBorder: InputBorder.none,
//             ),
//             onChanged: (value) => onChanged(value, index),
//           ),
//         );
//       }),
//     );
//   }
//
//   // Methods ----------------
//   void onChanged(String value, int index) {
//     String otp = controllers.map((controller) => controller.text).join();
//
//     if (value.isNotEmpty) {
//       widget.change(otp);
//
//       if (index < 3) {
//         FocusScope.of(context).nextFocus();
//       } else {
//         FocusScope.of(context).unfocus();
//         widget.submit(otp);
//       }
//     } else {
//       if (index > 0) {
//         FocusScope.of(context).previousFocus();
//       }
//     }
//   }
//
//   // Dispose ----------------
//   @override
//   void dispose() {
//     controllers.forEach((controller) => controller.dispose());
//     focusNodes.forEach((node) => node.dispose());
//     super.dispose();
//   }
// }
