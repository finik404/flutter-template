import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tproject/util/http/http.dart';

class CodeController extends GetxController {
  static CodeController get instance => Get.find();

  // Variables ----------------
  final TextEditingController codeInput = TextEditingController();
  final String codeErrors = '';
  String errors = '';

  // Methods ----------------
  Future<void> check() async {

  }
}
