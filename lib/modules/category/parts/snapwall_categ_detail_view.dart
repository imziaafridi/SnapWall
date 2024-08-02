import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/back_widget.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/data/response/status.dart';
import 'package:snapwall/modules/category/xController/categ_controller.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';
import 'package:snapwall/modules/search/pages/search_wallpaper_view.dart';

class SnapWallCategDetailView extends StatelessWidget {
  const SnapWallCategDetailView({
    super.key,
    required this.categXController,
    this.keywordCateg,
  });
  final CategXController categXController;
  final String? keywordCateg;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   backgroundColor: AppColors.whiteColor,
      // ),
      backgroundColor: AppColors.whiteColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenProportionBox(
            height: .02,
          ),
          // custom back btn
          const BackWidget(),

          const ScreenProportionBox(
            height: .04,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Title2TextWidget(
              titlePart2: keywordCateg ?? ' ',
            ),
          ),
          const ScreenProportionBox(
            height: .02,
          ),
          categXController.isBlank == false
              ? Expanded(
                  child: Obx(
                    () {
                      if (categXController.categTappedPhotos.value.status ==
                          Status.loading) {
                        return const Center(
                          child: LoadingWidget(),
                        );
                      } else if (categXController
                              .categTappedPhotos.value.status ==
                          Status.error) {
                        return Center(
                            child: Text(
                                'Error: ${categXController.categTappedPhotos.value.message}'));
                      } else {
                        return CategTappedPhotosGrid(
                          searchXController: categXController,
                          data: categXController
                              .categTappedPhotos.value.data!.photos,
                        );
                      }
                    },
                  ),
                )
              : const Center(
                  child: HeadingTextWidget(
                      title: 'Error While Fatching Category Data'),
                ),
        ],
      ).paddingSymmetric(
        horizontal: context.mqw * .04,
        vertical: context.mqh * .04,
      ),
    );
  }
}

class CategTappedPhotosGrid extends StatelessWidget {
  final List<PhotosDetailsSearchModel> data;
  final CategXController searchXController;

  const CategTappedPhotosGrid(
      {super.key, required this.data, required this.searchXController});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
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
          return ClipRRect(
            borderRadius: BorderRadius.circular(
              20,
            ),
            child: NetworkCacheImage(
              imageUrl: data[index].src.portrait,
            ),
          );
        },
      ),
    );
  }
}
