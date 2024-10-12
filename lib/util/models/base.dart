import 'package:flutter/material.dart';

class ItemModel {
  final String label;
  final dynamic value;

  ItemModel(this.label, this.value);
}

class FilterModel {
  final String label;
  final String value;
  final bool active;

  FilterModel(
    this.label,
    this.value,
    this.active,
  );

  FilterModel copyWith({String? label, String? value, bool? active}) {
    return FilterModel(
      label ?? this.label,
      value ?? this.value,
      active ?? this.active,
    );
  }
}

class ActionModel {
  final String label;
  final Function() onTap;
  final String? icon;
  final bool noPop;
  final bool isShow;

  ActionModel({
    required this.label,
    required this.onTap,
    this.icon,
    this.noPop = false,
    this.isShow = true,
  });
}

class ResponseModel {
  int status;
  dynamic data;
  dynamic errors;
  String? message;
  bool isError;

  ResponseModel({
    required this.status,
    this.data,
    this.errors,
    this.message,
    required this.isError,
  });
}

class TextModel {
  final String text;
  final TextStyle? styles;
  final Color? color;
  final double? size, lineHeight;
  final FontWeight? weight;
  final Function()? onTap;
  final bool isShow;

  TextModel(
    this.text, {
    this.styles,
    this.color,
    this.size,
    this.lineHeight,
    this.weight,
    this.onTap,
    this.isShow = true,
  });
}

class RadioModel {
  final String? label;
  dynamic value;
  bool isChecked;

  RadioModel({
    this.label,
    this.value,
    required this.isChecked,
  });
}