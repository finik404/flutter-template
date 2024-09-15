import 'package:flutter/material.dart';
import 'package:tproject/common/widgets/ClickArea.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/List.dart';
import 'package:tproject/util/extensions/media.dart';

import '../Text/Text.dart';

class UIActionMenu extends StatelessWidget {
  UIActionMenu({
    super.key,
    this.label,
    this.actions,
    this.content,
    this.hasScroll,
    this.height,
    this.topMargin,
    this.padding,
  });

  String? label;
  List<ActionModel>? actions;
  Widget? content;
  bool? hasScroll;
  double? height;
  double? topMargin;
  EdgeInsets? padding;

  @override
  Widget build(BuildContext context) {
    Widget childInside = Padding(
        padding: padding ?? EdgeInsets.fromLTRB(15, topMargin ?? 24, 15, 24),
        child: actions != null
            ? UIList(
                hasScroll: false,
                length: actions!.length,
                child: (index) {
                  return actions![index].isShow == null || actions![index].isShow == true
                      ? Material(
                          color: Colors.transparent,
                          child: UIClickArea(
                            onTap: () {
                              actions![index].onTap();
                              if (actions![index].noPop == null) Navigator.pop(context);
                            },
                            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
                            child: Row(
                              children: [
                                UIIcon(actions![index].icon, weight: FontWeight.normal, size: 18),
                                const SizedBox(width: 20),
                                Expanded(child: UIText(actions![index].label, size: 16)),
                              ],
                            ),
                          ),
                        )
                      : Container();
                },
              )
            : content!);

    Widget child = Stack(clipBehavior: Clip.none, children: [
      Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            if (label != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Container(
                  width: context.screenWidth,
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(width: 1),
                    ),
                  ),
                  child: UIText(
                    label!,
                    size: 14,
                    align: TextAlign.center,
                  ),
                ),
              ),

            // Actions
            hasScroll == true ? Expanded(child: SingleChildScrollView(child: childInside)) : childInside,
          ],
        ),
      ),

      // Indicator
      Positioned(
        top: -10,
        left: context.screenWidth / 2 - 75 / 2,
        child: Container(
          width: 75,
          height: 4,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
        ),
      )
    ]);

    return hasScroll == true ? FractionallySizedBox(heightFactor: height ?? 0.7, child: child) : child;
  }
}

class ActionModel {
  final String label;
  final String icon;
  final Function() onTap;
  final bool? noPop;
  final bool? isShow;

  ActionModel({
    required this.label,
    required this.icon,
    required this.onTap,
    this.noPop,
    this.isShow,
  });
}
