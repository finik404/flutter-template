import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/options.dart';

class UIImage extends StatelessWidget {
  const UIImage(
    this.image, {
    super.key,
    this.label,
    required this.width,
    this.height,
    this.fit = WidgetsOptions.imageFit,
    this.borderRadius,
    this.bg,
    this.letterSize,
    this.letterColor,
    this.letterWeight,
    this.icon,
  });

  final String? image, label;
  final double width;
  final double? height;
  final BoxFit fit;
  final BorderRadiusGeometry? borderRadius;
  final Color? bg;
  final double? letterSize;
  final Color? letterColor;
  final FontWeight? letterWeight;
  final String? icon;

  @override
  Widget build(BuildContext context) {
    TextStyle letterStyles = WidgetsOptions.imageLetterStyles;
    String? placeholderIcon = WidgetsOptions.imagePlaceholderIcon;

    return ClipRRect(
      borderRadius: borderRadius ?? WidgetsOptions.imageRadius,
      child: image != null
          // Cached image
          ? Stack(
              children: [
                Container(width: width, height: width, color: WidgetsOptions.imageBg),
                CachedNetworkImage(
                  imageUrl: image!,
                  fit: fit,
                  width: width,
                  height: height ?? width,
                  maxHeightDiskCache: 300,
                  maxWidthDiskCache: 300,
                  fadeInCurve: Curves.easeIn,
                  fadeInDuration: const Duration(milliseconds: 150),
                  fadeOutCurve: Curves.easeOut,
                  fadeOutDuration: const Duration(milliseconds: 200),
                )
              ],
            )

          // Placeholder
          : Container(
              width: width,
              height: width,
              decoration: BoxDecoration(color: bg ?? WidgetsOptions.imagePlaceholderBg, borderRadius: borderRadius ?? WidgetsOptions.imageRadius),
              child: Center(
                child: label != null && placeholderIcon == null
                    ? UIText(
                        label!.substring(0, 1).toUpperCase(),
                        size: letterSize ?? letterStyles.fontSize,
                        color: letterColor ?? letterStyles.color,
                        weight: letterWeight ?? letterStyles.fontWeight,
                      )
                    : UIIcon(
                        placeholderIcon ?? CIcons.camera,
                        size: letterSize ?? letterStyles.fontSize,
                        color: letterColor ?? letterStyles.color,
                        weight: letterWeight ?? letterStyles.fontWeight,
                      ),
              ),
            ),
    );
  }
}
