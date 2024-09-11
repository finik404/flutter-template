// import 'package:flutter/material.dart';
// import 'package:wordwise/core/_exports.dart';
// import 'package:wordwise/features/auth/layouts/Text.dart';
// import 'package:wordwise/hooks/Validator.dart';
//
// /*
//   ResetNewPassword Screen ----------------
//  */
// class ResetNewPasswordScreen extends StatefulWidget {
//   const ResetNewPasswordScreen({super.key});
//
//   @override
//   ResetNewPasswordScreenState createState() => ResetNewPasswordScreenState();
// }
//
// /*
//   State Component ----------------
//  */
// class ResetNewPasswordScreenState extends State<ResetNewPasswordScreen> {
//   // Variables ----------------
//   final GlobalKey<FormState> formKey = GlobalKey<FormState>();
//   final TextEditingController passwordInput = TextEditingController();
//
//   // Builder ----------------
//   @override
//   Widget build(BuildContext context) {
//     return AuthLayout(
//         label: S.of(context).new_password,
//         text: S.of(context).new_password_text,
//
//         // Content
//         children: [
//           Form(
//             key: formKey,
//             child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               // E-mail input
//               Input(
//                 S.of(context).new_password,
//                 passwordInput,
//                 type: InputTypes.password,
//                 validator: Validator.validate(context, [
//                   Validator.required,
//                   (context, value) => Validator.min(context, value, 6, message: S.of(context).password_min(6)),
//                   (context, value) => Validator.max(context, value, 70, message: S.of(context).password_max(70)),
//                 ]),
//                 autofocus: true,
//                 onSubmit: () => restore(context),
//               ),
//               const SizedBox(height: 30),
//
//               // Btn
//               Btn(S.of(context).restore, () => restore(context)),
//             ]),
//           ),
//         ]);
//   }
//
//   // Methods ----------------
//   Future<void> restore(BuildContext context) async {
//       showToast(context, S.of(context).success_restore_password, duration: 5);
//     // if (formKey.currentState!.validate()) {
//     //
//     //   // Navigate to back
//     //   int count = 0;
//     //   Navigator.of(context).popUntil((route) {
//     //     return count++ == 3;
//     //   });
//     // }
//   }
// }
