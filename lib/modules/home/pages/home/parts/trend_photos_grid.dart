import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/modules/home/h_controller/home_controller.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';
import 'package:snapwall/modules/home/pages/home/parts/favourite_button_widget.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';

class TrendPhotosGrid extends StatelessWidget {
  final List<PhotosModel> data;
  final TrendXController trendXController;
  final FavouritesXController favouritesXController;

  const TrendPhotosGrid({
    super.key,
    required this.data,
    required this.trendXController,
    required this.favouritesXController,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 0,
        vertical: 0,
      ),
      child: MasonryGridView.builder(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        itemCount: data.length,
        mainAxisSpacing: context.mqw * .01,
        crossAxisSpacing: context.mqh * .01,
        gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemBuilder: (context, index) {
          String photo = data[index].src.portrait;
          return GestureDetector(
            onTap: () => Get.to(
              SnapWallHomeDetailView(
                photosModel: data[index],
              ),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: Stack(
                children: [
                  NetworkCacheImage(
                    imageUrl: photo,
                  ),
                  Positioned(
                      top: 0.0,
                      right: 0.0,
                      child: Obx(() {
                        return FavouriteButtonWidget(
                          onTap: () {
                            favouritesXController.toggleFavourite(
                              photo,
                            );
                          },
                          isLiked: favouritesXController.isFavourite(
                            photo,
                          ),
                        );
                      })),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class SnapWallHomeDetailView extends StatelessWidget {
  const SnapWallHomeDetailView({
    super.key,
    required this.photosModel,
  });
  final PhotosModel photosModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      appBar: AppBar(),
      body: const Column(
        children: [
          Center(
            child: HeadingTextWidget(title: 'SnapWall Home Detail View'),
          ),
        ],
      ).paddingSymmetric(
        horizontal: context.mqw * .04,
        vertical: context.mqh * .04,
      ),
    );
  }
}
