import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/custom_image_or_icon_button.dart';
import 'package:snapwall/configs/components/insect_box_shadow_widget.dart';
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
      backgroundColor: AppColors.whiteLight,
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
            // for text field insect view
            if (FocusManager.instance.primaryFocus!.hasFocus) {
              searchXController.isFocused.value = false;
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ScreenProportionBox(height: .026),
              // header

              HeaderSectionSearchView(searchXController: searchXController),

              const ScreenProportionBox(height: .04),
              // searched text

              Obx(() {
                if (searchXController.searchText.value.isEmpty ||
                    searchXController.searchedPhotos.value.data?.isEmpty ==
                        true) {
                  return const SizedBox.shrink();
                } else {
                  return Title2TextWidget(
                    titlePart1: 'Showing wallpapers for',
                    titlePart2: searchXController.searchText.value,
                  );
                }
              }),

              const ScreenProportionBox(height: .04),

              // body or searched items
              HandleBodySearchWallpaper(searchXController: searchXController),
            ],
          ).paddingSymmetric(horizontal: context.mqw * .035),
        ),
      ),
    );
  }
}

class HeaderSectionSearchView extends StatelessWidget {
  const HeaderSectionSearchView({
    super.key,
    required this.searchXController,
  });

  final SearchXContoller searchXController;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: searchXController.scrollNotifier,
      builder: (BuildContext context, double value, Widget? child) {
        return AnimatedOpacity(
          opacity: value > 0 ? 0 : 1,
          duration: const Duration(milliseconds: 1000),
          child: value > 0
              ? const SizedBox.shrink()
              : Row(
                  children: [
                    Flexible(
                      flex: 8,
                      child: Obx(
                        () => InsetBoxShadowWidget(
                          offset: searchXController.isFocused.value
                              ? const Offset(5, 5)
                              : const Offset(10, 10),
                          inset: searchXController.isFocused.value,
                          blurRadius:
                              searchXController.isFocused.value ? 5 : 10,
                          child: SizedBox(
                            width: context.mqw * .8,
                            height: context.mqh * .048,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: SearchField(
                                searchXController: searchXController,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const ScreenProportionBox(width: .04),
                    Flexible(
                      child: Obx(
                        () => InsetBoxShadowWidget(
                          offset: searchXController.isSearchedTaped.value
                              ? const Offset(20, 20)
                              : const Offset(10, 10),
                          blurRadius:
                              searchXController.isSearchedTaped.value ? 20 : 10,
                          colorbx2: AppColors.greyLight,
                          inset: searchXController.isSearchedTaped.value,
                          child: CustomImageOrIconButton(
                            imageUrl: 'assets/icons/search.png',
                            isIcon: false,
                            size: context.mqh * .03,
                            onTap: () async {
                              if (searchXController.searchText.value.isEmpty) {
                                return;
                              }
                              searchXController.isSearchedTaped.value =
                                  !searchXController.isSearchedTaped.value;

                              if (searchXController.isSearchedTaped.value) {
                                await searchXController.refreshSearchedPhotos(
                                    searchXController.searchText.value);
                              }

                              debugPrint(
                                  'search Icons pressssed ${searchXController.isSearchedTaped.value}');
                            },
                          ).paddingOnly(top: 5, bottom: 5, left: 5, right: 5),
                        ),
                      ),
                    ),
                  ],
                ),
        );
      },
    );
  }
}

class HandleBodySearchWallpaper extends StatelessWidget {
  const HandleBodySearchWallpaper({
    super.key,
    required this.searchXController,
  });

  final SearchXContoller searchXController;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (searchXController.searchText.value.isEmpty &&
          searchXController.searchedPhotos.value.data == null) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Image(
                image: const AssetImage('assets/icons/search.png'),
                color: AppColors.greyLight,
                height: context.mqh * .24,
              ),
            ),
            15.h,
            const Center(
              child: HeadingTextWidget(
                title: 'Search and find your dream wallpaper',
                fontSize: 16.0,
              ),
            ),
          ],
        ).paddingOnly(top: context.mqh * .12);
      } else if (searchXController.searchedPhotos.value.data?.isEmpty == true) {
        return Column(
          children: [
            Center(
              child: Image.asset(
                'assets/icons/search-not-found.png',
                height: context.mqh * .2,
                color: AppColors.greyLight,
              ),
            ),
            20.h,
            const Center(
              child: HeadingTextWidget(
                title: 'Searched Wallpapers is not found !',
                fontSize: 16.0,
              ),
            ),
          ],
        ).paddingOnly(top: context.mqh * .12);
      } else {
        var state = searchXController.searchedPhotos.value.status;
        switch (state) {
          case Status.loading:
            return Center(
              child: const LoadingWidget(
                size: 40.0,
              ).paddingOnly(top: context.mqh * .3),
            );
          case Status.error:
            return Center(
              child: Text(
                  'Error: ${searchXController.searchedPhotos.value.message}'),
            );
          default:
            return Expanded(
              child: SearchedPhotosGrid(
                searchXController: searchXController,
                data: searchXController.searchedPhotos.value.data!,
              ),
            );
        }
      }
    });
  }
}

// class HandleWidgetsSearchedWallpaper extends StatelessWidget {
//   const HandleWidgetsSearchedWallpaper({
//     super.key,
//     required this.searchXController,
//   });

//   final SearchXContoller searchXController;

//   @override
//   Widget build(BuildContext context) {
//     return
    
    
//      searchXController.textController.text.isEmpty
//         ? const SizedBox.shrink()
//         :
//         // Center(
//         //   child: Image(
//         //     image: const AssetImage(
//         //       'assets/icons/search.png',
//         //     ),
//         //     color: AppColors.grey,
//         //     height: context.mqh *
//         //         (searchXController.isSearchedTaped.value ? 0.4 : 0.36),
//         //   ),
//         // );

       
//   }
// }

// class HeaderSearchWallpaper extends StatelessWidget {
//   const HeaderSearchWallpaper({
//     super.key,
//     required this.searchXController,
//   });

//   final SearchXContoller searchXController;

//   @override
//   Widget build(BuildContext context) {
//     return 
//     }
// }
