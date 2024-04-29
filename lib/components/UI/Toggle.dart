import 'package:flutter/material.dart';
import 'package:template/constants/colors.dart';

/*
  Toggle Component ----------------
 */
class Toggle extends StatefulWidget {
  // Variables ----------------
  final Function() func;
  final bool? isSwitch;

  // Props ----------------
  const Toggle(
    this.func, {
    this.isSwitch,
    super.key,
  });

  // Builder ----------------
  @override
  ToggleState createState() => ToggleState();
}

/*
  State Component ----------------
 */
class ToggleState extends State<Toggle> {
  // Variables ----------------
  late bool isSwitched;

  // InitState ----------------
  @override
  void initState() {
    super.initState();
    isSwitched = widget.isSwitch ?? false;
  }

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isSwitched = !isSwitched;
        });
        widget.func();
      },
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        height: 24,
        width: 48,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: isSwitched
                ? AppColors.orange
                : AppColors.orange.withOpacity(0.4)),
        child: Stack(
          children: [
            AnimatedPositioned(
              curve: Curves.easeIn,
              duration: const Duration(milliseconds: 200),
              left: isSwitched ? 25 : 0,
              right: isSwitched ? 0 : 25,
              top: 4.5,
              child: Container(
                height: 15,
                width: 15,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: AppColors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
