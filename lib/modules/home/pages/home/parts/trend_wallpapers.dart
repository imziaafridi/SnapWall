import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/configs/components/wallpaper_grid_plus_fav.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/data/response/status.dart';
import 'package:snapwall/modules/home/h_controller/home_controller.dart';

class TrendWallpapers extends StatelessWidget {
  const TrendWallpapers({
    super.key,
    required this.homeController,
  });

  final TrendXController homeController;

  @override
  Widget build(BuildContext context) {
    FavouritesXController favouritesController = FavouritesXController();
    return Obx(
      () {
        if (homeController.trendPhotos.value.status == Status.loading) {
          return const Center(
            child: LoadingWidget(),
          );
        } else if (homeController.trendPhotos.value.status == Status.error) {
          return Center(
              child:
                  Text('Error: ${homeController.trendPhotos.value.message}'));
        } else {
          return WallpaperGridPlusFav(
            photosList: homeController.trendPhotos.value.data!,
            itemCount: homeController.trendPhotos.value.data!.length,
            favouritesController: favouritesController,
          );
        }
      },
    );
  }
}
