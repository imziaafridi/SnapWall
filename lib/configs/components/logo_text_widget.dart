import 'package:flutter/material.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/heading_text_widget.dart';

class LogoTextWidget extends StatelessWidget {
  const LogoTextWidget({
    super.key,
    required this.title1,
    required this.title2,
    this.title1Color,
    this.title2Color,
    this.textDecoration,
    this.title1FontWeight,
    this.title2FontWeight,
  });
  final String title1;
  final String title2;
  final Color? title1Color;
  final Color? title2Color;
  final TextDecoration? textDecoration;
  final FontWeight? title1FontWeight;
  final FontWeight? title2FontWeight;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HeadingTextWidget(
          title: title1 ?? 'Snap',
          color: title1Color ?? AppColors.buttonColor,
          fontWeight: title1FontWeight ?? FontWeight.bold,
          textDecoration: textDecoration ?? TextDecoration.underline,
          textDecorationStyle: TextDecorationStyle.dotted,
          textDecorationColor: AppColors.grey,
        ),
        HeadingTextWidget(
          title: title2 ?? 'Wall',
          color: title2Color ?? AppColors.black,
          fontWeight: title2FontWeight ?? FontWeight.normal,
          textDecoration: textDecoration ?? TextDecoration.underline,
          textDecorationStyle: TextDecorationStyle.dotted,
          textDecorationColor: AppColors.grey,
        ),
      ],
    );
  }
}
