import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/extensions/media.dart';
import 'package:tproject/util/options/dialogs.dart';

class UIToast extends StatefulWidget {
  const UIToast(
    this.message, {
    super.key,
    this.isWarning = false,
  });

  final String message;
  final bool isWarning;

  @override
  UIToastState createState() => UIToastState();
}

class UIToastState extends State<UIToast> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _scaleAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      duration: const Duration(milliseconds: 300),
      reverseDuration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _scaleAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _animationController,
      curve: Curves.easeInOut,
    );

    _animationController.forward();

    Future.delayed(const Duration(seconds: 2), () {
      if (mounted && _animationController.isAnimating) {
        _animationController.reverse().then((value) {
          if (mounted) {
            Navigator.of(context).pop();
          }
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10),
        child: FadeTransition(
          opacity: _fadeAnimation,
          child: ScaleTransition(
            scale: _scaleAnimation,
            child: Material(
              color: Colors.transparent,
              child: Container(
                constraints: BoxConstraints(maxWidth: context.screenWidth * TDialogsOptions.toastMaxWidth),
                padding: TDialogsOptions.toastPadding,
                decoration: BoxDecoration(
                  color: widget.isWarning ? Colors.orange : Colors.green,
                  borderRadius: TDialogsOptions.toastBorderRadius,
                  boxShadow: TDialogsOptions.toastBoxShadow,
                  border: TDialogsOptions.toastBorder,
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    UIIcon(widget.isWarning ? TIcons.warning : 'f336', color: TColors.white, size: 18, weight: FontWeight.bold),
                    const SizedBox(width: 10),
                    Flexible(
                      child: Wrap(
                        children: [UIText(widget.message, color: TColors.white, size: 12, weight: FontWeight.bold)],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
