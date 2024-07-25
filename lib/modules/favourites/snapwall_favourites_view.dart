import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/heading_text_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';

class SnapWallFavouritesView extends StatelessWidget {
  SnapWallFavouritesView({
    super.key,
  });

  final FavouritesXController favouritesXController = Get.put(
    FavouritesXController(),
  );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header section
            HeadingTextWidget(
              title: 'Favourites Tab',
            ),
            // favourites sections view
          ],
        ).paddingSymmetric(
          horizontal: context.mqw * .01,
          vertical: context.mqh * .01,
        ),
      ),
    );
  }
}
