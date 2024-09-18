import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/options/image.dart';

class UIImage extends StatelessWidget {
  const UIImage(
    this.image, {
    super.key,
    this.label,
    required this.width,
    this.height,
    this.fit = TImageOptions.fit,
    this.borderRadius,
    this.bg,
    this.letterSize,
    this.letterColor,
    this.letterWeight,
    this.icon,
    this.decoration,
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
  final BoxDecoration? decoration;

  @override
  Widget build(BuildContext context) {
    TextStyle letterStyles = TImageOptions.letterStyles;
    String? placeholderIcon = TImageOptions.placeholderIcon;
    BoxDecoration imageDecoration = decoration ?? TImageOptions.decoration;

    return Container(
      width: width,
      height: height ?? width,
      decoration: BoxDecoration(
        color: bg ?? TImageOptions.placeholderBg,
        borderRadius: borderRadius ?? TImageOptions.radius,
        boxShadow: imageDecoration.boxShadow,
        border: imageDecoration.border,
      ),
      child: image != null
          // Cached image
          ? Stack(
              children: [
                Container(width: width, height: width, color: TImageOptions.bg),
                CachedNetworkImage(
                  imageUrl: image!,
                  fit: fit,
                  maxHeightDiskCache: 300,
                  maxWidthDiskCache: 300,
                  fadeInCurve: Curves.easeIn,
                  fadeInDuration: const Duration(milliseconds: 150),
                  fadeOutCurve: Curves.easeOut,
                  fadeOutDuration: const Duration(milliseconds: 200),
                ),
              ],
            )

          // Placeholder
          : Center(
              child: label != null && placeholderIcon == null
                  ? UIText(
                      label!.substring(0, 1).toUpperCase(),
                      size: letterSize ?? letterStyles.fontSize,
                      color: letterColor ?? letterStyles.color,
                      weight: letterWeight ?? letterStyles.fontWeight,
                    )
                  : UIIcon(
                      placeholderIcon ?? TIcons.camera,
                      size: letterSize ?? letterStyles.fontSize,
                      color: letterColor ?? letterStyles.color,
                      weight: letterWeight ?? letterStyles.fontWeight,
                    ),
            ),
    );
  }
}
