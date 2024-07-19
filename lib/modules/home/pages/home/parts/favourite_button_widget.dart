import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class FavouriteButtonWidget extends StatelessWidget {
  final void Function()? onTap;
  final bool isLiked;

  const FavouriteButtonWidget({
    super.key,
    required this.onTap,
    this.isLiked = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(
          max(
            context.mqw * .005,
            context.mqh * .005,
          ),
        ),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: AppColors.whiteColor.withOpacity(.6),
        ),
        child: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border_outlined,
          color: isLiked ? AppColors.red : AppColors.black,
        ),
      ),
    );
  }
}
