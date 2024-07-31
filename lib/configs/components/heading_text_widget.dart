import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapwall/configs/color/color.dart';

class HeadingTextWidget extends StatelessWidget {
  const HeadingTextWidget(
      {super.key,
      required this.title,
      this.color,
      this.fontSize,
      this.fontWeight,
      this.textDecoration,
      this.textDecorationColor,
      this.textDecorationStyle});

  final String title;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;
  final TextDecoration? textDecoration;
  final Color? textDecorationColor;
  final TextDecorationStyle? textDecorationStyle;

  @override
  Widget build(BuildContext context) {
    return Text(
      softWrap: true,
      overflow: TextOverflow.fade,
      title,
      textAlign: TextAlign.center,
      style: GoogleFonts.raleway(
        fontSize: fontSize ?? 22,
        fontWeight: fontWeight ?? FontWeight.w600,
        color: color ?? AppColors.black,
        decoration: textDecoration ?? TextDecoration.none,
        decorationColor: textDecorationColor ?? AppColors.black,
        decorationStyle: textDecorationStyle ?? TextDecorationStyle.solid,
      ),
    );
  }
}
