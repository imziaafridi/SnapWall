import 'package:flutter/material.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class ScreenProportionBox extends StatelessWidget {
  final double? height;
  final double? width;
  final Widget? child;

  const ScreenProportionBox({
    super.key,
    this.height,
    this.width,
    this.child,
  });

  @override
  Widget build(BuildContext context) => SizedBox(
        height: height != null ? context.mqh * height! : null,
        width: width != null ? context.mqw * width! : null,
        child: width != null ? child : null,
      );
}
