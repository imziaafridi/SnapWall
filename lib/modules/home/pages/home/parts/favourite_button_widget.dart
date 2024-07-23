import 'dart:math';

import 'package:flutter/material.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';

class FavouriteButtonWidget extends StatelessWidget {
  FavouriteButtonWidget({
    super.key,
    required this.onTap,
    this.isLiked = false,
  });

  void Function()? onTap;
  bool isLiked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: GlassMorphism(
        blur: 6,
        opacity: .4,
        child: Icon(
          isLiked ? Icons.favorite : Icons.favorite_border_outlined,
          color: isLiked ? AppColors.red : AppColors.black,
        ),
      ),
    );
  }
}
