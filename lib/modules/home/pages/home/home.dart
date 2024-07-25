import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/configs/components/logo_text_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/data/response/response.dart';
import 'package:snapwall/modules/home/h_controller/home_controller.dart';
import 'package:snapwall/modules/home/pages/home/parts/trend_photos_grid.dart';
import 'parts/snapwall_home_header_view.dart';

class SnapWallHomeView extends StatelessWidget {
  const SnapWallHomeView({super.key});

  @override
  Widget build(BuildContext context) {
    final TrendXController trendXController = Get.put(
      TrendXController(),
    );
    final FavouritesXController favouritesXController = Get.put(
      FavouritesXController(),
    );

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenProportionBox(
            height: .1,
          ),

          // header section
          const SnapWallHomeHeaderView().paddingOnly(
            right: context.mqw * .01,
          ),

          const ScreenProportionBox(
            height: .08,
          ),

          // wallpaper section title
          const LogoTextWidget(
            title1: 'Trending',
            title2: '\tWallpapers',
            title1Color: AppColors.black,
            title2Color: AppColors.grey,
            title1FontWeight: FontWeight.bold,
            title2FontWeight: FontWeight.normal,
            textDecoration: TextDecoration.none,
          ),

          // wallpaper view
          Expanded(
            child: Obx(() {
              if (trendXController.trendPhotos.value.status == Status.loading) {
                return const Center(
                  child: LoadingWidget(),
                );
              } else if (trendXController.trendPhotos.value.status ==
                  Status.error) {
                return Center(
                  child: Text(
                    trendXController.trendPhotos.value.message!,
                  ),
                );
              }
              return TrendPhotosGrid(
                data: trendXController.trendPhotos.value.data?.photos ?? [],
                trendXController: trendXController,
                favouritesXController: favouritesXController,
              );
            }),
          ),
        ],
      ).paddingSymmetric(
        horizontal: context.mqw * .025,
      ),
    );
  }
}
