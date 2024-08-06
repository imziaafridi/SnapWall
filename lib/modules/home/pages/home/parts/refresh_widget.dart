import 'package:flutter/material.dart';
import 'package:snapwall/configs/color/color.dart';

class RefreshWidget extends StatelessWidget {
  const RefreshWidget({
    super.key,
    required this.child,
    required this.onRefresh,
  });
  final Widget child;
  final Future<void> Function() onRefresh;
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      semanticsLabel: 'Refreshing',
      semanticsValue: 'Loading..',
      edgeOffset: 4.0,
      triggerMode: RefreshIndicatorTriggerMode.onEdge,
      color: AppColors.black,
      backgroundColor: AppColors.whiteLight,
      onRefresh: onRefresh,
      child: child,
    );
  }
}
