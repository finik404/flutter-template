import 'package:flutter/material.dart';
import 'package:wordwise/core/_exports.dart';
import 'package:wordwise/features/auth/layouts/_index.dart';
import 'package:wordwise/features/auth/views/reset/code.dart';
import 'package:wordwise/hooks/Validator.dart';

/*
  Reset Screen ----------------
 */
class ResetScreen extends StatefulWidget {
  const ResetScreen({super.key});

  @override
  ResetScreenState createState() => ResetScreenState();
}

/*
  State Component ----------------
 */
class ResetScreenState extends State<ResetScreen> {
  // Variables ----------------
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailInput = TextEditingController();

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return AuthLayout(
        label: S.of(context).restore_password_title,
        text: S.of(context).restore_password_text,
        textWidth: 1,

        // Content
        children: [
          Form(
            key: formKey,
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // E-mail input
              Input(
                S.of(context).email,
                emailInput,
                type: InputTypes.email,
                validator: Validator.validate(context, [Validator.required, Validator.email]),
                autofocus: true,
                onSubmit: () => submit(context),
              ),
              const SizedBox(height: 30),

              // Btn
              Btn(S.of(context).receive_code, () => submit(context)),
            ]),
          ),
        ]);
  }

  // Methods ----------------
  Future<void> submit(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      navigate(context, ResetCodeScreen(email: emailInput.text));
    }
  }
}
