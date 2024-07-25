import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';
import 'package:snapwall/modules/home/pages/home/parts/favourite_button_widget.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';

class WallpaperGridPlusFav extends StatelessWidget {
  const WallpaperGridPlusFav({
    super.key,
    required this.photosList,
    required this.itemCount,
    required this.favouritesController,
  });
  final FavouritesXController favouritesController;

  final int itemCount;
  final List photosList;
  @override
  Widget build(BuildContext context) {
    return MasonryGridView.builder(
      itemCount: photosList.length,
      gridDelegate: const SliverSimpleGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
      ),
      // mainAxisSpacing: 4,
      // crossAxisSpacing: 4,
      itemBuilder: (context, index) {
        PhotosModel photo = photosList[index];
        // var s = photo.src.portrait;
        return Stack(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(
                20,
              ),
              child: NetworkCacheImage(
                imageUrl: photo.src.portrait,
              ),
            ),
            // favourite button
            // if(homeController.)
            Positioned(
              top: context.height * .0,
              right: context.width * .0,
              // left: 0,
              child: Obx(() {
                return FavouriteButtonWidget(
                  onTap: () {
                    favouritesController.toggleFavourite(
                      photo.src.tiny,
                    );

                    debugPrint('is Wallpaper Liked! ${photo.src.tiny}');
                  },
                  isLiked: favouritesController.isFavourite(photo.src.tiny),
                );
              }),
            ),
            Positioned(
              bottom: context.mqh * .0,
              left: 0,
              right: 0,
              top: context.mqh * .3,
              child: GlassMorphism(
                blur: 6,
                opacity: .2,
                child: Text(
                  photo.alt,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.roboto(
                    color: AppColors.red,
                    fontWeight: FontWeight.w400,
                    fontSize: 12,
                  ),
                ).paddingSymmetric(
                  horizontal: 10,
                ),
              ),
            ),
          ],
        ).paddingSymmetric(
          horizontal: context.mqw * .004,
          vertical: context.mqh * .004,
        );
      },
    );
  }
}
