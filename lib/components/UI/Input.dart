import 'package:flutter/material.dart';
import 'package:flutter_letmetalk/components/UI/IconBtn.dart';
import 'package:flutter_letmetalk/constants/colors.dart';

enum InputType { password, search }

/*
  Input Component ----------------
 */
class Input extends StatefulWidget {
  // Variables ----------------
  final String text;
  final TextEditingController value;
  final TextInputType? textType;
  final InputType? type;
  final String? Function(String?)? validator;
  final Function(String)? onChange;

  // Props ----------------
  const Input(
    this.text,
    this.value, {
    Key? key,
    this.textType = TextInputType.text,
    this.type,
    this.validator,
    this.onChange,
  }) : super(key: key);

  // Builder ----------------
  @override
  InputState createState() => InputState();
}

/*
  State Component ----------------
 */
class InputState extends State<Input> {
  // Variables ----------------
  bool isShowPassword = false;
  late FocusNode isFocus = FocusNode();

  // Builder ----------------
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.value,
      keyboardType: widget.textType,
      obscureText: widget.type == InputType.password && !isShowPassword,
      validator: widget.validator,
      onChanged: widget.onChange,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: widget.text,
        suffixIcon:
            // Если это пароль
            widget.type == InputType.password
                ? IconButton(
                    // Переключить видимость пароля
                    onPressed: () {
                      setState(() {
                        isShowPassword = !isShowPassword;
                      });
                    },
                    // Иконка
                    icon: Icon(isShowPassword
                        ? Icons.visibility_outlined
                        : Icons.visibility_off_outlined),
                    color: Theme.of(context).primaryColor)
                :
                // Если это поиск
                widget.type == InputType.search
                    ? IconBtn(
                        Icons.close,
                        func: () {
                          // Очистить поле
                          widget.value.clear();
                        },
                      )
                    : null,
        prefixIcon: widget.type == InputType.search
            ? const Icon(Icons.search, color: AppColors.blue)
            : null,
        filled: true,
        fillColor: Colors.white,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            width: 1,
            color: AppColors.grayDark,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(width: 1, color: AppColors.blue),
        ),
      ),
    );
  }
}
