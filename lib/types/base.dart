import 'package:flutter/widgets.dart';

class ListItem {
  final String value;
  final String label;

  ListItem(this.value, this.label);
}

class TabItem {
  final String label;
  final Widget widget;

  TabItem(this.label, this.widget);
}