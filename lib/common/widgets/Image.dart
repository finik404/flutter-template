import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:tproject/common/widgets/Icon/Icon.dart';
import 'package:tproject/common/widgets/Svg.dart';
import 'package:tproject/common/widgets/Text/Text.dart';
import 'package:tproject/util/constants/colors.dart';
import 'package:tproject/util/constants/styles.dart';

class UIImage extends StatelessWidget {
  const UIImage(
    this.image, {
    super.key,
    this.label,
    required this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.radius,
    this.bg = TColors.bg,
    this.letterSize = 40,
    this.letterColor,
    this.letterWeight = FontWeight.bold,
    this.icon,
    this.decoration,
    this.isAssets = false,
  });

  final String? image, label;
  final double width;
  final double? height;
  final BoxFit fit;
  final double? radius;
  final Color bg;
  final double? letterSize;
  final Color? letterColor;
  final FontWeight? letterWeight;
  final String? icon;
  final BoxDecoration? decoration;
  final bool isAssets;

  @override
  Widget build(BuildContext context) {
    final placeholderIcon = FontAwesomeIcons.camera;

    return Container(
      width: width,
      height: height ?? width,
      decoration: BoxDecoration(color: bg, borderRadius: radius != null ? BorderRadius.circular(radius!) : TStyles.br),
      child: image != null
          // Cached image
          ? Stack(
              children: [
                Container(width: width, height: width, color: bg),
                ClipRRect(
                  borderRadius: radius != null ? BorderRadius.circular(radius!) : TStyles.br,
                  child: isAssets
                      ? image!.endsWith('.svg')
                          ? UISvg(
                              image!,
                              width: width,
                              height: width,
                            )
                          : Image.asset(
                              image!,
                              width: width,
                              height: width,
                            )
                      : CachedNetworkImage(
                          imageUrl: image!,
                          width: width,
                          height: width,
                          fit: fit,
                          maxHeightDiskCache: 300,
                          maxWidthDiskCache: 300,
                          fadeInCurve: Curves.easeIn,
                          fadeInDuration: const Duration(milliseconds: 150),
                          fadeOutCurve: Curves.easeOut,
                          fadeOutDuration: const Duration(milliseconds: 200),
                        ),
                ),
              ],
            )

          // Placeholder
          : Center(
              child: label != null
                  ? UIText(
                      label!.substring(0, 1).toUpperCase(),
                      size: letterSize,
                      color: letterColor,
                      weight: letterWeight,
                    )
                  : UIIcon(
                      placeholderIcon,
                      size: letterSize,
                      color: letterColor,
                      weight: letterWeight,
                    ),
            ),
    );
  }
}
