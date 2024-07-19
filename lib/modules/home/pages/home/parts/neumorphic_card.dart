import 'package:flutter/material.dart';
import 'package:snapwall/configs/color/color.dart';

class NeumorphicCard extends StatelessWidget {
  final Widget? child;

  const NeumorphicCard({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.whiteColor,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            offset: const Offset(4, 4),
            blurRadius: 15,
          ),
          BoxShadow(
            color: Colors.white.withOpacity(0.7),
            offset: const Offset(-4, -4),
            blurRadius: 15,
          ),
        ],
      ),
      child: child,
    );
  }
}
