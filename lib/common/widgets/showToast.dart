import 'package:flutter/material.dart';
import 'package:talktime/core/_exports.dart';

void showToast(BuildContext context, String message, {bool? isWarning, double? bottom, int? duration}) {
  OverlayEntry overlayEntry = OverlayEntry(
    builder: (context) => Align(
      alignment: Alignment.topCenter,
      child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 10), child: AnimatedToast(message: message, isWarning: isWarning)),
    ),
  );

  Overlay.of(context, rootOverlay: true).insert(overlayEntry);
  Future.delayed(Duration(seconds: duration ?? 2), () {
    overlayEntry.remove();
  });
}

class AnimatedToast extends StatefulWidget {
  final String message;
  final bool? isWarning;

  const AnimatedToast({
    super.key,
    required this.message,
    this.isWarning,
  });

  @override
  _AnimatedToastState createState() => _AnimatedToastState();
}

class _AnimatedToastState extends State<AnimatedToast> with SingleTickerProviderStateMixin {
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
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _fadeAnimation,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          color: Colors.transparent,
          child: CustomToast(message: widget.message, isWarning: widget.isWarning),
        ),
      ),
    );
  }
}

// Toast
class CustomToast extends StatelessWidget {
  final String message;
  final bool? isWarning;

  const CustomToast({
    super.key,
    required this.message,
    this.isWarning,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: context.screenWidth * 0.8),
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(30),
        border: Border.all(color: AppColors.grayLight),
      ),
      child: Row(mainAxisSize: MainAxisSize.min, children: [
        CIcon(isWarning == true ? CIcons.info_circle : CIcons.check,
            color: isWarning == true ? const Color(0xfffF37A7A) : Colors.green, size: 18),
        const SizedBox(width: 15),
        Flexible(
            child: Wrap(children: [
          CText(message, color: AppColors.black, size: 12),
        ])),
      ]),
    );
  }
}
