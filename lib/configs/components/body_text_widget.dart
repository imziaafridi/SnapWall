import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BodyTextWidget extends StatelessWidget {
  const BodyTextWidget({
    super.key,
    required this.title,
    this.fontSize,
    this.color,
    this.fontWeight,
  });

  final String title;
  final double? fontSize;
  final Color? color;
  final FontWeight? fontWeight;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.roboto(
        fontSize: fontSize ?? 16, // default font size
        color: color ?? Colors.black, // default color
        fontWeight: fontWeight ?? FontWeight.normal, // default font weight
      ),
    );
  }
}
