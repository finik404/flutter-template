import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/IconButton.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/common/widgets/Toggle.dart';
import 'package:tproject/features/auth/layouts/auth.dart';

/*
  Login Screen ----------------
 */
class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  LoginScreenState createState() => LoginScreenState();
}

/*
  State Component ----------------
 */
class LoginScreenState extends State<LoginScreen> {
  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();
  bool value = false;

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        label: 'S.of(context).login',

        // Content
        children: [
          Form(
            key: formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // E-mail input
              // Input(S.of(context).email, emailInput,
              //     type: InputTypes.email, validator: Validator.validate(context, [Validator.required, Validator.email])),
              // const SizedBox(height: 20),
              //
              // // Password input
              // Input(S.of(context).password, passwordInput, type: InputTypes.password, validator: Validator.validate(context, [Validator.required])),
              // const SizedBox(height: 12),
              //
              // // Forgot password
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //   const SizedBox(),
              //   TextLink(S.of(context).forgot_password, size: 14, color: context.theme.secondary, onTap: () => navigate(context, const ResetScreen())),
              // ]),
              // const SizedBox(height: 30),
              //
              // // Btn
              // Btn(S.of(context).sign_in, () => login(context)),

              UIToggle(value, onChange: () => setState(() => value = !value))

            ]),
          )
        ]);
  }

// // Methods ----------------
// Future<void> login(BuildContext context) async {
//   if (formKey.currentState!.validate()) {
//     pushReplacementWithoutNavBar(context, FadeRoute(const Tabs()));
//   }
// }
}
