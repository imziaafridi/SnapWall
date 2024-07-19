import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/home/data/response/status.dart';
import 'package:snapwall/modules/home/h_controller/home_controller.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';

import 'favourite_button_widget.dart';

class TrendWallpapers extends StatelessWidget {
  const TrendWallpapers({
    super.key,
    required this.homeController,
  });

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (homeController.trendPhotos.value.status == Status.loading) {
        return const Center(
          child: LoadingWidget(),
        );
      } else if (homeController.trendPhotos.value.status == Status.error) {
        return Center(
            child: Text('Error: ${homeController.trendPhotos.value.message}'));
      } else {
        return MasonryGridView.builder(
          itemCount: homeController.trendPhotos.value.data!.photos.length,
          gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          // mainAxisSpacing: 4,
          // crossAxisSpacing: 4,
          itemBuilder: (context, index) {
            PhotosModel photo =
                homeController.trendPhotos.value.data!.photos[index];
            // var s = photo.src.portrait;
            return Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                  child: NetworkCacheImage(
                    imageUrl: photo.src.portrait,
                  ),
                ),
                // favourite button
                Positioned(
                  top: context.height * .0,
                  right: context.width * .0,
                  child: Obx(() {
                    return FavouriteButtonWidget(
                      onTap: () {
                        homeController.toggleFavourite(
                          photo.src.tiny,
                        );

                        debugPrint('is Wallpaper Liked! ${photo.src.tiny}');
                      },
                      isLiked: homeController.isFavourite(photo.src.tiny),
                    );
                  }),
                ),
              ],
            ).paddingSymmetric(
              horizontal: context.mqw * .004,
              vertical: context.mqh * .004,
            );
          },
        );
      }
    });
  }
}
