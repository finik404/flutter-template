import 'package:flutter/material.dart';

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

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return LoginLayout(
        label: S.of(context).login,
        text: S.of(context).login_text,

        // Content
        child: Form(
          key: formKey,
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // E-mail input
            Input(S.of(context).email, emailInput,
                type: InputTypes.email, validator: Validator.validate(context, [Validator.required, Validator.email])),
            const SizedBox(height: 20),

            // Password input
            Input(S.of(context).password, passwordInput, type: InputTypes.password, validator: Validator.validate(context, [Validator.required])),
            const SizedBox(height: 12),

            // Forgot password
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              const SizedBox(),
              TextLink(S.of(context).forgot_password, size: 14, color: context.theme.secondary, onTap: () => navigate(context, const ResetScreen())),
            ]),
            const SizedBox(height: 30),

            // Btn
            Btn(S.of(context).sign_in, () => login(context)),
          ]),
        ));
  }

  // Methods ----------------
  Future<void> login(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      pushReplacementWithoutNavBar(context, FadeRoute(const Tabs()));
    }
  }
}
