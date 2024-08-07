import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/components/load_more_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/modules/home/h_controller/home_controller.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';
import 'package:snapwall/modules/home/pages/home/parts/favourite_button_widget.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';

import 'snapwall_home_detail_view.dart';

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
    return Obx(
      () {
        return Stack(
          children: [
            MasonryGridView.builder(
              controller: trendXController.scrollController,
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              itemCount:
                  data.length + (trendXController.loadMore.value ? 1 : 0),
              mainAxisSpacing: context.mqw * .01,
              crossAxisSpacing: context.mqh * .01,
              gridDelegate:
                  const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
              ),
              itemBuilder: (context, index) {
                if (index < data.length) {
                  String photo = data[index].src.portrait;
                  return GestureDetector(
                    onTap: () => Get.to(
                      () => SnapWallHomeDetailView(
                        photosModel: data[index],
                      ),
                    ),
                    child: ClipRRect(
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
                    ),
                  );
                } else {
                  return const SizedBox.shrink();
                }
              },
            ),
            if (trendXController.loadMore.value && trendXController.page > 1)
              const LoadMoreWidget(
                leftPosition: .28,
                rightPosition: .28,
                topPosition: .26,
                bottomPosition: .26,
              ),
          ],
        );
      },
    );
  }
}
