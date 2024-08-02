import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';

class BackWidget extends StatelessWidget {
  const BackWidget({
    super.key,
    this.icon,
    this.color,
    this.size,
  });
  final IconData? icon;
  final Color? color;
  final double? size;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.back(),
      child: Icon(
        icon ?? CupertinoIcons.back,
        size: size ?? 30,
        color: color ?? AppColors.grey,
      ),
    );
  }
}
