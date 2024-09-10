import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent_bottom_nav_bar_v2.dart';
import 'package:wordwise/core/_exports.dart';
import 'package:wordwise/features/auth/layouts/login.dart';
import 'package:wordwise/features/main/views/tabs.dart';
import 'package:wordwise/hooks/Validator.dart';

/*
  Register Screen ----------------
 */
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

/*
  State Component ----------------
 */
class RegisterScreenState extends State<RegisterScreen> {
  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameInput = TextEditingController();
  final TextEditingController emailInput = TextEditingController();
  final TextEditingController passwordInput = TextEditingController();

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return LoginLayout(
      label: S.of(context).register,
      text: S.of(context).register_text,

      // Content
      child: Form(
          key: formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Name input
            Input(S.of(context).name, nameInput,
                validator: Validator.validate(
                    context, [Validator.required, (context, value) => Validator.max(context, value, 25, message: S.of(context).name_max(50))])),
            const SizedBox(height: 20),

            // E-mail input
            Input(S.of(context).email, emailInput,
                type: InputTypes.email, validator: Validator.validate(context, [Validator.required, Validator.email])),
            const SizedBox(height: 20),

            // Password input
            Input(S.of(context).password, passwordInput,
                type: InputTypes.password,
                validator: Validator.validate(context, [
                  Validator.required,
                  (context, value) => Validator.min(context, value, 6, message: S.of(context).password_min(6)),
                  (context, value) => Validator.max(context, value, 70, message: S.of(context).password_max(70))
                ])),
            const SizedBox(height: 40),

            // Btn
            Btn(S.of(context).create_account, () => register(context)),
          ])),
    );
  }

  // Methods ----------------
  Future<void> register(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      pushReplacementWithoutNavBar(context, FadeRoute(const Tabs()));
    }
  }
}
