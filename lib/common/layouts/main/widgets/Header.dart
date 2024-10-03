import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gas/common/widgets/Icon/IconButton.dart';
import 'package:gas/common/widgets/Text/Text.dart';
import 'package:gas/util/constants/colors.dart';

class Header extends StatelessWidget {
  const Header(
    this.label, {
    super.key,
    required this.hasArrow,
    this.bg,
  });

  final String label;
  final bool hasArrow;
  final Color? bg;

  @override
  Widget build(BuildContext context) {
    return SliverLayoutBuilder(
      builder: (BuildContext context, constraints) {
        final scrolled = constraints.scrollOffset > 15;

        return SliverAppBar(
          floating: true,
          pinned: true,
          surfaceTintColor: Colors.transparent,
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Container(),
          toolbarHeight: 65,

          // Label
          flexibleSpace: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: scrolled ? Colors.black.withOpacity(0.35) : Colors.transparent,
                  spreadRadius: 0,
                  blurRadius: 15,
                  offset: const Offset(0, 4),
                ),
              ],
              color: scrolled ? TColors.bg : (bg ?? TColors.bg),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
            child: FlexibleSpaceBar(
              expandedTitleScale: 1.0,
              collapseMode: CollapseMode.parallax,
              centerTitle: false,
              titlePadding: hasArrow ? const EdgeInsets.symmetric(vertical: 12, horizontal: 20) : const EdgeInsets.all(20),
              title: Row(
                mainAxisAlignment: hasArrow ? MainAxisAlignment.spaceBetween : MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Back icon
                  if (hasArrow)
                    Stack(
                      children: [
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(shape: BoxShape.circle, color: TColors.secondary),
                        ),
                        Center(
                          child: UIIconButton(
                            TIcons.left,
                            () => Navigator.pop(context),
                            color: TColors.primary,
                            size: 16,
                            padding: const EdgeInsets.all(12),
                          ),
                        ),
                      ],
                    ),

                  // Label
                  UIText(
                    label,
                    weight: FontWeight.bold,
                    size: 20,
                    align: TextAlign.center,
                    isOverflow: true,
                  ),

                  // Empty space
                  if (hasArrow) const SizedBox(width: 40),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
