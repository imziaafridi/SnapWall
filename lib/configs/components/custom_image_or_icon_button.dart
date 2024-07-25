import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class CustomImageOrIconButton extends StatelessWidget {
  const CustomImageOrIconButton({
    super.key,
    this.iconData,
    this.imageUrl,
    required this.isIcon,
    required this.onTap,
    this.size,
  });

  final IconData? iconData;
  final String? imageUrl;
  final bool isIcon;
  final VoidCallback onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final iconSize = max(context.mqw * 0.003, context.mqh * 0.003);
    final imageSize = context.mqh * 0.01;
    return GestureDetector(
      onTap: onTap,
      child: isIcon
          ? Icon(
              iconData,
              size: size ?? iconSize,
              color: AppColors.black,
            )
          : Image.asset(
              imageUrl ?? 'assets/icons/search.png',
              height: size ?? imageSize,
              color: AppColors.black,
            ),
    );
  }
}
