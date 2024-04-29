import 'package:flutter/material.dart';

/*
  Функция (предупреждающее окно) ----------------
 */
void warning(BuildContext context, String text) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 3),
    ),
  );
}
