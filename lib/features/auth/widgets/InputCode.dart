import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:tproject/features/auth/controllers/screens/code.dart';
import 'package:tproject/util/constants/colors.dart';

class InputCode extends StatelessWidget {
  const InputCode({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CodeController.instance;

    return PinCodeTextField(
      controller: controller.codeInput,
      autoDisposeControllers: false,
      length: controller.codeCount,
      obscureText: false,
      animationType: AnimationType.fade,
      cursorColor: TColors.white,
      keyboardType: TextInputType.number,
      autoFocus: true,
      pinTheme: PinTheme(
        shape: PinCodeFieldShape.box,
        borderRadius: BorderRadius.circular(8),
        fieldHeight: 70,
        fieldWidth: 55,
        inactiveColor: TColors.gray,
        activeColor: TColors.gray,
        selectedColor: TColors.secondary,
        inactiveFillColor: TColors.bg,
        activeFillColor: TColors.bg,
        selectedFillColor: TColors.bg,
        borderWidth: 1,
        inactiveBorderWidth: 1,
        activeBorderWidth: 1,
        selectedBorderWidth: 1,
      ),
      enableActiveFill: true,
      onCompleted: (value) => controller.check(),
      textStyle: const TextStyle(
        fontSize: 40,
        color: TColors.white,
        fontWeight: FontWeight.normal,
      ),
      appContext: context,
    );
  }
}
