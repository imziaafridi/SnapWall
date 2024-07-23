import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/loading_widget.dart';
import 'package:snapwall/configs/components/wallpaper_grid_plus_fav.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/data/response/status.dart';
import 'package:snapwall/modules/home/pages/home/home.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class SearchWallpapersView extends StatelessWidget {
  const SearchWallpapersView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final searchXController = Get.put(
      SearchXContoller(),
    ); // Inject dependency

    double mqh = context.mqh;
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const ScreenProportionBox(
              height: .02,
            ),
            // header
            Row(
              children: [
                SizedBox(
                  width: context.mqw * .8,
                  height: context.mqh * .056,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(
                      12,
                    ),
                    child: SearchField(
                      searchTxtController: searchXController.searchController,
                    ),
                  ),
                ),
                const ScreenProportionBox(
                  width: .04,
                ),
                CustomImageButton(
                  imageUrl: 'assets/icons/search.png',
                  isIcon: false,
                  size: context.mqh * .04,
                  onTap: () {
                    debugPrint('search Icons pressed');
                  },
                ),
              ],
            ),
            const ScreenProportionBox(
              height: .15,
            ),
            // searched text
            HeadingTextWidget(
              title: 'Searched Wallpapers',
            ),
            // body or searched items
          ],
        ).paddingSymmetric(
          horizontal: context.mqw * .035,
        ),
      ),
    );
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    super.key,
    required this.searchTxtController,
  });
  final TextEditingController searchTxtController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: searchTxtController,
      decoration: InputDecoration(
        prefixIcon: const Icon(Icons.search),
        hintText: 'Search',
        border: InputBorder.none, // Disable border
        fillColor: Colors.grey[200],
        filled: true,
        contentPadding: EdgeInsets.all(
          max(
            context.mqw * .012,
            context.mqh * .012,
          ),
        ),
      ),
      onChanged: (query) {
        // Perform search here
        debugPrint('Searching for: $query');
      },
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

class searchWallp extends StatelessWidget {
  const searchWallp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final SearchXContoller searchXController = Get.put(
      SearchXContoller(),
    );
    FavouritesController favouritesController = FavouritesController();
    return Obx(() {
      if (searchXController.searchedPhotos.value.status == Status.loading) {
        return const Center(
          child: LoadingWidget(),
        );
      } else if (searchXController.searchedPhotos.value.status ==
          Status.error) {
        return Center(
            child: Text(
                'Error: ${searchXController.searchedPhotos.value.message}'));
      } else {
        return Expanded(
          child: WallpaperGridPlusFav(
            photosList: searchXController.searchedPhotos.value.data!.photos,
            itemCount:
                searchXController.searchedPhotos.value.data!.photos.length,
            favouritesController: favouritesController,
          ),
        );
      }
    });
  }
}

// class CustomNeumorphicWidget extends StatelessWidget {
//   final NeumorphicShape? shape;
//   final NeumorphicBoxShape? boxShape;
//   final double? depth;
//   final LightSource? lightSource;
//   final Color? color;
//   final double? intensity;
//   final Widget child;

//   const CustomNeumorphicWidget({
//     super.key,
//     this.shape,
//     this.boxShape,
//     this.depth,
//     this.lightSource,
//     this.color,
//     this.intensity,
//     required this.child,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Neumorphic(
//       style: NeumorphicStyle(
//         shape: shape ?? NeumorphicShape.concave,
//         boxShape:
//             boxShape ?? NeumorphicBoxShape.roundRect(BorderRadius.circular(12)),
//         depth: depth ?? 8,
//         lightSource: lightSource ?? LightSource.topLeft,
//         color: color ?? Colors.deepPurple.shade400,
//         intensity: intensity ?? 0.5,
//       ),
//       child: child,
//     );
//   }
// }
