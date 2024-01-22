import 'package:flutter/material.dart';

/*
  CGrid Component ----------------
 */
class CGrid extends StatelessWidget {
  // Variables ----------------
  final int length;
  final double aspect;
  final Function(BuildContext, int)? builder;
  final dynamic child;
  final ScrollController? controller;

  // Props ----------------
  const CGrid({
    required this.length,
    required this.aspect,
    this.builder,
    this.child,
    this.controller,
    Key? key,
  }) : super(key: key);

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: length,
      controller: controller,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1 / aspect,
        crossAxisSpacing: 0,
        mainAxisSpacing: 0,
      ),
      itemBuilder: (context, index) {
        if (builder != null) {
          return builder!(context, index);
        } else if (child != null) {
          if (child is Widget Function(int)) {
            return child(index);
          } else {
            return child;
          }
        }
        return Container();
      },
    );
  }
}