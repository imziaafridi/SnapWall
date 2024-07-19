import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapwall/configs/color/color.dart';

class HeadingTextWidget extends StatelessWidget {
  HeadingTextWidget({
    super.key,
    required this.title,
  });

  String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: GoogleFonts.raleway(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: AppColors.black,
      ),
    );
  }
}
