import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/load_more_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';
import 'package:snapwall/modules/search/pages/auto_scroll_up_btn_for_search_widget.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class SearchedPhotosGrid extends StatelessWidget {
  final List<PhotosDetailsSearchModel> data;
  final SearchXContoller searchXController;

  const SearchedPhotosGrid(
      {super.key, required this.data, required this.searchXController});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Stack(
        children: [
          MasonryGridView.builder(
            controller: searchXController.scrollController,
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            itemCount: data.length + (searchXController.loadMore.value ? 1 : 0),
            mainAxisSpacing: context.mqw * .02,
            crossAxisSpacing: context.mqh * .014,
            gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemBuilder: (context, index) {
              if (index < data.length) {
                return searchXController.searchedPhotos.value.data != null
                    ? ClipRRect(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                        child: NetworkCacheImageWithTransitionEffect(
                          imageUrl: data[index].src.portrait,
                        ),
                      )
                    : const Center(
                        child: HeadingTextWidget(
                          title:
                              'Searched Wallpaper is not found\nplease try again',
                          fontSize: 16,
                        ),
                      );
              } else {
                return const SizedBox.shrink();
              }
            },
          ),
          AutoScrollUpButtonForSearchWidget(
              searchXContoller: searchXController),
          if (searchXController.loadMore.value && searchXController.page > 1)
            const LoadMoreWidget(),
        ],
      );
    });
  }
}
