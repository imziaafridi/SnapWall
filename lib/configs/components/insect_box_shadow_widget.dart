import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;

import '../color/color.dart';
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart';

class InsetBoxShadowWidget extends StatelessWidget {
  const InsetBoxShadowWidget({
    super.key,
    required this.child,
    required this.offset,
    this.blurRadius,
    this.inset,
    this.colorbx1,
    this.colorbx2,
  });
  final Widget child;
  final Offset offset;
  final double? blurRadius;
  final Color? colorbx1;
  final Color? colorbx2;

  final bool? inset;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteLight,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            offset: -offset,
            blurRadius: blurRadius ?? 15,
            color: colorbx1 ?? AppColors.whiteColor,
            inset: inset ?? false,
          ),
          BoxShadow(
            offset: offset,
            blurRadius: blurRadius ?? 15,
            color: colorbx2 ?? AppColors.greyLight,
            inset: inset ?? false,
          ),
        ],
      ),
      child: child,
    );
  }
}
