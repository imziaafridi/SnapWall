import 'package:flutter/material.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/heading_text_widget.dart';

class Title2TextWidget extends StatelessWidget {
  const Title2TextWidget({
    super.key,
    this.titlePart1,
    required this.titlePart2,
    this.size,
    this.weightT1,
    this.weightT2,
    this.colorT1,
    this.colorT2,
    // required this.searchXController,
  });

  // final SearchXContoller searchXController;
  final String? titlePart1;
  final String titlePart2;
  final double? size;
  final FontWeight? weightT1;
  final FontWeight? weightT2;
  final Color? colorT1;
  final Color? colorT2;

// searchXController.searchText.value for titlePart2 -> search view
// Showing wallpapers for titlePart1 -> search view

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          HeadingTextWidget(
            title: titlePart1 ?? 'Showing wallpapers for',
            color: colorT1 ?? AppColors.grey,
            fontWeight: weightT1 ?? FontWeight.normal,
            fontSize: size ?? 20,
          ),
          SingleChildScrollView(
            child: HeadingTextWidget(
              title: '\t$titlePart2',
              fontSize: size ?? 20,
              fontWeight: weightT2 ?? FontWeight.bold,
              color: colorT2 ?? AppColors.black,
            ),
          ),
        ],
      ),
    );
  }
}
