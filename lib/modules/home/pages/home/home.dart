import 'package:flutter/cupertino.dart';
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
import 'package:snapwall/modules/home/pages/home/parts/refresh_widget.dart';
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
      body: RefreshWidget(
        onRefresh: () => trendXController.refreshTrendingPhotos(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenProportionBox(
              height: .04,
            ),

            // header section
            const SnapWallHeaderView(
              title1: 'Snap',
              title2: 'Wall',
              title1Color: AppColors.grey,
              title2Color: AppColors.red,
              title2FontWeight: FontWeight.w500,
              textDecoration: TextDecoration.underline,
              navTabIndexIconImgBtn1: 2,
              navTabIndexIconImgBtn2: 1,
              isIcon1: false,
              isIcon2: true,
              image1: 'assets/icons/search.png',
              icon2: CupertinoIcons.square_grid_2x2,
            ).paddingOnly(
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
                if (trendXController.trendPhotos.value.status ==
                    Status.loading) {
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
                  data: trendXController.trendPhotos.value.data ?? [],
                  trendXController: trendXController,
                  favouritesXController: favouritesXController,
                );
              }),
            ),
          ],
        ).paddingOnly(
          left: context.mqw * .04,
          right: context.mqw * .04,
          top: context.mqh * .04,
        ),
      ),
    );
  }
}
