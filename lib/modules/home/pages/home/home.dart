import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/routes/routes_name.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/core/utils/helper_get_controllers/favourites_controller.dart';
import 'package:snapwall/main.dart';
import 'package:snapwall/modules/home/h_controller/home_controller.dart';

import 'parts/trend_wallpapers.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(
      HomeController(),
    );

    final FavouritesController favController = Get.put(
      FavouritesController(),
    );

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      // appBar: AppBar(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const ScreenProportionBox(
            height: .06,
          ),
          //header section
          Row(
            children: [
              HeadingTextWidget(title: 'SnapWall'),
              const Spacer(),
              // SearchWidget(
              //   searchEditingController: homeController.searchEditingController,
              // ),
              10.w,
              CustomImageButton(
                imageUrl: 'assets/icons/search.png',
                isIcon: false,
                onTap: () {
                  final controller = Get.find<NavBarController>();
                  controller.jumpTo(2);
                  debugPrint('search pressed!');
                },
              ),
              10.w,
              CustomImageButton(
                iconData: Icons.category,
                isIcon: true,
                onTap: () {
                  final controller = Get.find<NavBarController>();
                  controller
                      .jumpTo(1); // Assuming the category tab is at index 1
                  debugPrint('categ pressed!');
                },
              ),
            ],
          ).paddingOnly(
            right: context.mqw * .01,
          ),

          const ScreenProportionBox(
            height: .06,
          ),
          // favourite section
          Obx(() {
            if (favController.likedPhotos.value.isNotEmpty) {
              return HeadingTextWidget(title: 'Favourites');
            } else {
              return const SizedBox.shrink();
            }
          }),

          Obx(() {
            if (favController.likedPhotos.value.isEmpty) {
              return const Center(
                child: SizedBox.shrink(),
              );
            } else {
              return SizedBox(
                height: 100,
                child: Obx(() {
                  final likedPhotos = favController.likedPhotos.value;
                  if (likedPhotos.isEmpty) {
                    return const Center(
                      child: Text('No liked photos yet!'),
                    );
                  }
                  return Expanded(
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: likedPhotos.length,
                      itemBuilder: (context, index) {
                        final likedPhoto = likedPhotos[index];
                        return SizedBox(
                          width: context.mqw * .3,
                          child: NetworkImageWidget(
                            boxFit: BoxFit.contain,
                            borderRadius: 0,
                            imageUrl: likedPhoto,
                          ),
                        ).paddingOnly(left: context.mqw * .009);
                      },
                    ),
                  );
                }),
              );
            }
          }),

          HeadingTextWidget(title: 'Trending'),
          // wallpaper section

          Expanded(
            child: TrendWallpapers(
              homeController: homeController,
            ),
          ),
        ],
      ).paddingOnly(
        left: context.mqw * .008,
        right: context.mqw * .008,
      ),
    );
  }
}

class CustomImageButton extends StatelessWidget {
  const CustomImageButton({
    super.key,
    this.iconData,
    this.imageUrl,
    required this.isIcon,
    required this.onTap,
    this.size,
  });

  final IconData? iconData;
  final String? imageUrl;
  final bool isIcon;
  final VoidCallback onTap;
  final double? size;

  @override
  Widget build(BuildContext context) {
    final iconSize = max(context.mqw * 0.003, context.mqh * 0.003);
    final imageSize = context.mqh * 0.01;
    return GestureDetector(
      onTap: onTap,
      child: isIcon
          ? Icon(
              iconData,
              size: size ?? iconSize,
              color: AppColors.black,
            )
          : Image.asset(
              imageUrl ?? 'assets/icons/search.png',
              height: size ?? imageSize,
              color: AppColors.black,
            ),
    );
  }
}
