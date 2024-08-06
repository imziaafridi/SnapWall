import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/modules/home/pages/home/parts/favourite_button_widget.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';

class FavouritesPhotosGrid extends StatelessWidget {
  final List<String> data;
  final FavouritesXController favouritesXController;

  const FavouritesPhotosGrid({
    super.key,
    required this.data,
    required this.favouritesXController,
  });

  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: data.length,
      mainAxisSpacing: context.mqw * .01,
      crossAxisSpacing: context.mqh * .01,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      itemBuilder: (context, index) {
        String photo = data[index];

        return ClipRRect(
          borderRadius: BorderRadius.circular(
            20,
          ),
          child: Stack(
            children: [
              NetworkCacheImageWithTransitionEffect(
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
        );
      },
    ).paddingSymmetric(
      vertical: context.mqh * .02,
    );
  }
}
