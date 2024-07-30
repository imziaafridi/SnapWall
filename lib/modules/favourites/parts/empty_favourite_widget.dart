import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/heading_text_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class EmptyFavouriteWidget extends StatelessWidget {
  const EmptyFavouriteWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Image(image: AssetImage(''), fit: BoxFit.cover, height: context.mqh * .01,),
        Icon(
          CupertinoIcons.heart_fill,
          color: AppColors.red,
          size: max(context.mqw * .2, context.mqh * .2),
        ),
        10.h,
        const HeadingTextWidget(
            title:
                'Favourite wallpapers list is empty. Add one to get started!'),
      ],
    );
  }
}
