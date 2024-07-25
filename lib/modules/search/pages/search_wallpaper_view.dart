import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/custom_image_or_icon_button.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/data/response/status.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';
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
        child: SingleChildScrollView(
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
                      height: context.mqh * .4,
                    ),
                  );
                } else {
                  return Row(
                    children: [
                      const HeadingTextWidget(
                        title: 'Showing wallpapers for',
                        color: AppColors.grey,
                        fontWeight: FontWeight.normal,
                        fontSize: 20,
                      ),
                      HeadingTextWidget(
                        title: '\t${searchXController.searchText.value}',
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ],
                  );
                }
              }),
              const ScreenProportionBox(height: .04),

              // body or searched items
              Obx(() {
                if (searchXController.searchText.isEmpty &&
                    searchXController.searchedPhotos.value.data?.photos ==
                        null) {
                  return const Center(
                    child: HeadingTextWidget(
                      title: 'Search and find your dream wallpaper',
                    ),
                  );
                } else {
                  if (searchXController.searchedPhotos.value.status ==
                      Status.loading) {
                    return const Center(child: LoadingWidget());
                  } else if (searchXController.searchedPhotos.value.status ==
                      Status.error) {
                    return Center(
                        child: Text(
                            'Error: ${searchXController.searchedPhotos.value.message}'));
                  } else {
                    return SearchedPhotosGrid(
                      searchXController: searchXController,
                      data: searchXController.searchedPhotos.value.data!.photos,
                    );
                  }
                }
              }),
            ],
          ).paddingSymmetric(horizontal: context.mqw * .035),
        ),
      ),
    );
  }
}

class SearchedPhotosGrid extends StatelessWidget {
  final List<PhotosDetailsSearchModel> data;
  final SearchXContoller searchXController;

  const SearchedPhotosGrid(
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

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.searchXController});
  final SearchXContoller searchXController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        // searchTxtController. .value = value;
        searchXController.onSearchTextChanged(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        border: InputBorder.none,
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: EdgeInsets.all(
          max(context.mqw * .012, context.mqh * .012),
        ),
      ),
      keyboardType: TextInputType.text,
      style: textStyleTemp,
    );
  }
}

TextStyle textStyleTemp = GoogleFonts.roboto(
  fontSize: 16,
  fontWeight: FontWeight.w400,
  color: Colors.black,
  letterSpacing: 0.2,
  height: 1.5,
);
