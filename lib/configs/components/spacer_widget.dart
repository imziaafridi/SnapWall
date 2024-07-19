import 'package:flutter/material.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class SpacerWidget extends StatelessWidget {
  SpacerWidget({
    super.key,
    this.weight,
    this.height,
  });

  double? weight;
  double? height;

  @override
  Widget build(BuildContext context) {
    // double weight = context.mqw;
    // double height = context.mqh;
    return SizedBox(
      height: context.mqh * (height ?? 0), // use 1 as default value
      width: context.mqw * (weight ?? 0), // use 1 as default value
    );
  }
}
