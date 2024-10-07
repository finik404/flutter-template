import 'package:flutter/material.dart';
import 'package:tproject/features/auth/controllers/screens/code.dart';
import 'package:tproject/util/theme/styles/inputs.dart';

class InputCode extends StatelessWidget {
  const InputCode({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = CodeController.instance;
    final styles = TInputsThemes.inputTheme(controller.codeErrors.isNotEmpty);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: List.generate(4, (index) {
        return SizedBox(
          width: 65,
          height: 65,
          child: TextField(
            controller: controller.controllers[index],
            focusNode: controller.focusNodes[index],
            keyboardType: TextInputType.number,
            textAlign: TextAlign.center,
            maxLength: 1,
            autofocus: index == 0,
            textInputAction: index < 3 ? TextInputAction.next : TextInputAction.done,
            decoration: InputDecoration(
              hintText: '0',
              hintStyle: styles.hintStyle,
              counterText: '',
              contentPadding: styles.contentPadding,
              border: styles.border,
              enabledBorder: styles.enabledBorder,
              focusedBorder: styles.focusedBorder,
              errorBorder: styles.errorBorder,
            ),
            onChanged: (value) => controller.onChange(context, value, index),
          ),
        );
      }),
    );
  }
}
