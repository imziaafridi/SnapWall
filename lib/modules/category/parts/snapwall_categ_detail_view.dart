import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/back_widget.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/fade_transition_widget.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/data/response/status.dart';
import 'package:snapwall/modules/category/parts/categ_searched_photos_grid.dart';
import 'package:snapwall/modules/category/xController/categ_controller.dart';

import 'package:snapwall/modules/search/pages/search_wallpaper_view.dart';

class SnapWallCategDetailView extends StatelessWidget {
  const SnapWallCategDetailView({
    super.key,
    required this.categXController,
  });
  final CategXController categXController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenProportionBox(
            height: .02,
          ),
          // custom back btn

          Obx(() {
            return BackWidget(
              onTap: categXController.loadMoreCateg.value
                  ? null
                  : () async {
                      // pagination is fully reset before navigating back.
                      await categXController.clearCategSearchPhotos();
                      // Back
                      Get.back();
                    },
            );
          }),

          const ScreenProportionBox(
            height: .03,
          ),

          FadeTransitionWidget(
            delay: const Duration(milliseconds: 3000),
            // duration: const Duration(milliseconds: 3000),,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Obx(() {
                return Title2TextWidget(
                  titlePart2: categXController.categLabel.value,
                );
              }),
            ),
          ),
          const ScreenProportionBox(
            height: .01,
          ),
          categXController.isBlank == false
              ? Expanded(
                  child: Obx(
                    () {
                      final state =
                          categXController.categSearchPhotosList.value.status;
                      switch (state) {
                        case Status.loading:
                          return const Center(child: LoadingWidget());
                        case Status.error:
                          return Center(
                            child: Text(
                                'Error: ${categXController.categSearchPhotosList.value.message}'),
                          );
                        default:
                          return CategSearchedPhotosGrid(
                            data: categXController
                                    .categSearchPhotosList.value.data ??
                                [],
                            categXController: categXController,
                          );
                      }
                    },
                  ),
                )
              : const Center(
                  child: HeadingTextWidget(
                      title: 'Error While Fatching Category Data'),
                ),
        ],
      ).paddingOnly(
        left: context.mqw * .04,
        right: context.mqw * .04,
        top: context.mqh * .04,
        bottom: context.mqh * .004,
      ),
    );
  }
}
