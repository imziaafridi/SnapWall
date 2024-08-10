import 'package:flutter/material.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/body_text_widget.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class LoadMoreWidget extends StatelessWidget {
  const LoadMoreWidget({
    super.key,
    this.leftPosition,
    this.rightPosition,
    this.topPosition,
    this.bottomPosition,
  });

  final double? leftPosition;
  final double? rightPosition;
  final double? topPosition;
  final double? bottomPosition;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: context.mqw * (leftPosition ?? 0.28),
      right: context.mqw * (rightPosition ?? .28),
      top: context.mqh * (topPosition ?? .26),
      bottom: context.mqh * (bottomPosition ?? .26),
      child: GlassMorphism(
        blur: 2.8,
        opacity: .4,
        // borderRadius: 0.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const LoadingWidget(
              size: 45,
            ),
            15.h,
            const BodyTextWidget(
              title: 'Loading More Images...',
              fontSize: 11,
              fontWeight: FontWeight.bold,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
