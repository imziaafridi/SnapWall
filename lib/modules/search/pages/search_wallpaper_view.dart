import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/custom_image_or_icon_button.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/configs/components/title2_text_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/data/response/status.dart';

import 'package:snapwall/modules/search/pages/parts/search_photos_grid.dart';
import 'package:snapwall/modules/search/pages/parts/searh_field.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class SearchWallpapersView extends StatelessWidget {
  SearchWallpapersView({super.key});
  final searchXController = Get.put(
    SearchXContoller(),
  ); // Inject dependency

  @override
  Widget build(BuildContext context) {
    double mqh = context.mqh;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenProportionBox(height: .026),
            // header
            Row(
              children: [
                SizedBox(
                  width: context.mqw * .8,
                  height: context.mqh * .056,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: SearchField(
                      searchXController: searchXController,
                    ),
                  ),
                ),
                const ScreenProportionBox(width: .04),
                CustomImageOrIconButton(
                  imageUrl: 'assets/icons/search.png',
                  isIcon: false,
                  size: context.mqh * .04,
                  onTap: () {
                    if (searchXController.searchText.isEmpty) {
                      return;
                    }
                    searchXController.fetchSearchedPhotos(
                      searchXController.searchText.value,
                    );
                    searchXController.isSearchedTaped.value = true;
                    debugPrint('search Icons pressed');
                  },
                ),
              ],
            ),
            const ScreenProportionBox(height: .04),
            // searched text

            Obx(() {
              if (searchXController.searchText.isEmpty) {
                return Center(
                  child: Image(
                    image: const AssetImage(
                      'assets/icons/search.png',
                    ),
                    color: AppColors.grey,
                    height: context.mqh *
                        (searchXController.isSearchedTaped.value ? 0.4 : 0.36),
                  ),
                );
              } else {
                return Title2TextWidget(
                  titlePart1: 'Showing wallpapers for',
                  titlePart2: searchXController.searchText.value,
                );
              }
            }),
            const ScreenProportionBox(height: .04),

            // body or searched items
            Obx(() {
              if (searchXController.searchText.isEmpty &&
                  searchXController.searchedPhotos.value.data?.photos == null) {
                return const Center(
                  child: HeadingTextWidget(
                    title: 'Search and find your dream wallpaper',
                  ),
                );
              } else {
                var state = searchXController.searchedPhotos.value.status;
                switch (state) {
                  case Status.loading:
                    return const Center(child: LoadingWidget());
                  case Status.error:
                    return Center(
                      child: Text(
                          'Error: ${searchXController.searchedPhotos.value.message}'),
                    );
                  default:
                    return Expanded(
                      child: SearchedPhotosGrid(
                        searchXController: searchXController,
                        data:
                            searchXController.searchedPhotos.value.data!.photos,
                      ),
                    );
                }
              }
            }),
          ],
        ).paddingSymmetric(horizontal: context.mqw * .035),
      ),
    );
  }
}
