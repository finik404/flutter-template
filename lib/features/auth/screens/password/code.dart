// import 'package:flutter/material.dart';
// import 'package:wordwise/core/_exports.dart';
// import 'package:wordwise/features/auth/layouts/Text.dart';
// import 'package:wordwise/features/auth/views/reset/new_password.dart';
// import 'package:wordwise/features/auth/widgets/InputCode.dart';
//
// /*
//   ResetCode Screen ----------------
//  */
// class ResetCodeScreen extends StatefulWidget {
//   // Variables ----------------
//   final String email;
//
//   // Props ----------------
//   const ResetCodeScreen({
//     super.key,
//     required this.email,
//   });
//
//   @override
//   ResetCodeScreenState createState() => ResetCodeScreenState();
// }
//
// /*
//   State Component ----------------
//  */
// class ResetCodeScreenState extends State<ResetCodeScreen> {
//   // Variables ----------------
//   String code = '';
//   String error = '';
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     return AuthLayout(
//       label: S.of(context).code_title,
//       textWidget: Texts([
//         S.of(context).code_text,
//         {
//           'text': widget.email,
//           'color': context.isDark ? context.primaryColor : context.theme.primary,
//           'weight': context.isDark ? FontWeight.normal : FontWeight.bold,
//         }
//       ]),
//
//       // Content
//       children: [
//         // Code
//         InputCode(
//           change: (value) => setState(() => code = value),
//           submit: (value) => check(context),
//         ),
//         if (error.isNotEmpty)
//           Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//             const SizedBox(height: 10),
//             Padding(padding: const EdgeInsets.symmetric(horizontal: 10), child: CText(error, color: Colors.redAccent, size: 12))
//           ]),
//         const SizedBox(height: 30),
//
//         // Btn
//         Btn(S.of(context).check, () => check(context))
//       ],
//     );
//   }
//
//   // Methods ----------------
//   Future<void> check(BuildContext context) async {
//     if (code.isEmpty) {
//       setState(() => error = S.of(context).error_code_required);
//     } else if (code.length != 4) {
//       setState(() => error = S.of(context).error_code_full);
//     } else {
//       setState(() => error = '');
//       navigate(context, const ResetNewPasswordScreen());
//     }
//   }
// }
