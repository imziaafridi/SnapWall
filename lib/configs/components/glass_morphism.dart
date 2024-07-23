import 'dart:ui';

import 'package:flutter/material.dart';

class GlassMorphism extends StatelessWidget {
  const GlassMorphism({
    super.key,
    required this.blur,
    required this.opacity,
    required this.child,
    this.bgPaint,
  });
  final double blur;
  final double opacity;
  final Widget child;
  final Color? bgPaint;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(
        20.0,
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(
          sigmaX: blur > 0.0 ? blur : 1.0,
          sigmaY: blur > 0.0 ? blur : 1.0,
        ),
        child: Container(
          padding: const EdgeInsets.all(
            6,
          ),
          decoration: BoxDecoration(
            color: bgPaint != null
                ? bgPaint!.withOpacity(opacity)
                : Colors.white.withOpacity(opacity),
            borderRadius: BorderRadius.circular(
              20.0,
            ),
            border: Border.all(
              color: Colors.white.withOpacity(
                0.2,
              ),
              width: 1.5,
            ),
          ),
          child: child,
        ),
      ),
    );
  }
}
