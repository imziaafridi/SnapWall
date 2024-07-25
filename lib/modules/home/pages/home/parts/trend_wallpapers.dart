import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/configs/components/wallpaper_grid_plus_fav.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/data/response/status.dart';
import 'package:snapwall/modules/home/h_controller/home_controller.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

import 'favourite_button_widget.dart';

class TrendWallpapers extends StatelessWidget {
  const TrendWallpapers({
    super.key,
    required this.homeController,
  });

  final TrendXController homeController;

  @override
  Widget build(BuildContext context) {
    FavouritesXController favouritesController = FavouritesXController();
    return Obx(() {
      if (homeController.trendPhotos.value.status == Status.loading) {
        return const Center(
          child: LoadingWidget(),
        );
      } else if (homeController.trendPhotos.value.status == Status.error) {
        return Center(
            child: Text('Error: ${homeController.trendPhotos.value.message}'));
      } else {
        return WallpaperGridPlusFav(
          photosList: homeController.trendPhotos.value.data!.photos,
          itemCount: homeController.trendPhotos.value.data!.photos.length,
          favouritesController: favouritesController,
        );
      }
    });
  }
}

// class TrendOrSearchListData extends StatelessWidget {
//   const TrendOrSearchListData({
//     super.key,
//     required this.homeController,
//   });
//   final HomeController homeController;

//   @override
//   Widget build(BuildContext context) {
//     final SearchXContoller categController = Get.put(
//       SearchXContoller(),
//     );
//     return Scaffold(
//       body: Obx(() {
//         if (categController.categPhotos.value.data == null) {
//           return TrendWallpapers(homeController: homeController);
//         } else {
//           return const SearchWallpapers();
//         }
//       }),
//     );
//   }
// }
