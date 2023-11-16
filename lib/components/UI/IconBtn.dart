import 'package:flutter/material.dart';

/*
  IconBtn Component ----------------
 */
class IconBtn extends StatelessWidget {
  // Variables ----------------
  final IconData icon;
  final Function()? func;
  final String? link;
  final double? size;
  final Color? color;

  // Props ----------------
  const IconBtn(
    this.icon, {
    this.func,
    this.link,
    this.size,
    this.color,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: func ??
            () {
              Navigator.pushNamed(context, link!);
            },
        padding: EdgeInsets.zero,
        constraints: const BoxConstraints(),
        style: const ButtonStyle(
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
        iconSize: size,
        icon: Icon(
          icon,
          color: color,
        ));
  }
}
