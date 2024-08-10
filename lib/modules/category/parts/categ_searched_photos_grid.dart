import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/configs/components/load_more_widget.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/category/xController/categ_controller.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';
import 'package:snapwall/modules/home/pages/home/parts/snapwall_home_detail_view.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';

class CategSearchedPhotosGrid extends StatelessWidget {
  final List<PhotosDetailsSearchModel> data;
  final CategXController categXController;

  const CategSearchedPhotosGrid({
    super.key,
    required this.data,
    required this.categXController,
  });

  @override
  Widget build(BuildContext context) {
    return Obx(
      () {
        return categXController.categSearchPhotosList.value.data!.isNotEmpty
            ? Stack(
                children: [
                  MasonryGridView.builder(
                    controller: categXController.scrollControllerCateg,
                    shrinkWrap: true,
                    physics: const BouncingScrollPhysics(),
                    itemCount: data.length +
                        (categXController.loadMoreCateg.value ? 1 : 0),
                    mainAxisSpacing: context.mqw * .02,
                    crossAxisSpacing: context.mqh * .014,
                    gridDelegate:
                        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemBuilder: (context, index) {
                      if (index < data.length) {
                        PhotosDetailsSearchModel photosDetailsSearchModel =
                            data[index];
                        return GestureDetector(
                          onTap: () => Get.to(() => SnapWallHomeDetailView(
                                photosDetailsSearchModel:
                                    photosDetailsSearchModel,
                              )),
                          child: categXController.isScrollingToTop.value
                              ? NetworkCacheImageWithTransitionEffect(
                                  imageUrl:
                                      photosDetailsSearchModel.src.portrait,
                                  borderRadius: 20,
                                  fadeTransDelay: 0,
                                  fadeTransAnimate: 0,
                                )
                              : NetworkCacheImageWithTransitionEffect(
                                  imageUrl:
                                      photosDetailsSearchModel.src.portrait,
                                  borderRadius: 20,
                                  fadeTransDelay: 400,
                                  // fadeTransAnimate: 800,
                                ),
                        );
                      } else {
                        return const SizedBox.shrink();
                      }
                    },
                  ),

                  // auto scroll upword button - scroll-controller
                  AutoScrollUpButtonWidget(categXController: categXController),

                  // loading more ... pagination or infinity scroll
                  if (categXController.loadMoreCateg.value &&
                      categXController.page > 1)
                    const LoadMoreWidget()
                ],
              )
            : const Center(child: LoadingWidget());
      },
    );
  }
}

class AutoScrollUpButtonWidget extends StatelessWidget {
  const AutoScrollUpButtonWidget({
    super.key,
    required this.categXController,
  });

  final CategXController categXController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: categXController.scrollNotifier,
      builder: (context, value, child) {
        return Positioned(
          bottom: context.mqh * .01,
          right: context.mqw * .02,
          child: AnimatedOpacity(
            opacity: value > 0 ? 1 : 0,
            duration: const Duration(milliseconds: 1000),
            child: GestureDetector(
              onTap: categXController.loadMoreCateg.value
                  ? null
                  : () {
                      categXController.isScrollingToTop.value = true;
                      categXController.scrollControllerCateg.animateTo(0,
                          duration: const Duration(milliseconds: 3000),
                          curve: Curves.easeInOut);
                      Future.delayed(const Duration(milliseconds: 3000), () {
                        categXController.isScrollingToTop.value = false;
                      });
                    },
              child: GlassMorphism(
                blur: 4,
                opacity: .2,
                bgPaint: AppColors.grey,
                child: Image(
                  image: const AssetImage('assets/icons/up-arrows.png'),
                  color: AppColors.red,
                  height: context.mqh * .022,
                ).paddingAll(2),
              ),
            ),
          ),
        );
      },
    );
  }
}
