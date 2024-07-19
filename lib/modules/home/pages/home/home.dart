import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/home/h_controller/home_controller.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';

import 'parts/trend_wallpapers.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(
      HomeController(),
    );

    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SpacerWidget(
            height: .06,
          ),
          //header section
          Row(
            children: [
              HeadingTextWidget(title: 'SnapWall'),
              const Spacer(),
              ImageOrIconButtonWidget(
                image: 'assets/icons/search.png',
                isIcon: false,
                onTap: () {
                  print('search pressed!');
                },
              ),
              10.w,
              ImageOrIconButtonWidget(
                icon: Icons.category,
                isIcon: true,
                onTap: () {
                  print('categ pressed!');
                },
              ),
            ],
          ).paddingOnly(
            right: context.mqw * .01,
          ),
          SpacerWidget(
            height: .06,
          ),
          // favourite section
          HeadingTextWidget(title: 'Favourites'),
          Obx(() {
            if (homeController.likedPhotos.value.isEmpty) {
              return const Center(child: Text('Photos is not liked yet!'));
            }
            return Container(
              color: AppColors.grey.withOpacity(.1),
              height: 100,
              child: Obx(() {
                final likedPhotos = homeController.likedPhotos.value;
                if (likedPhotos.isEmpty) {
                  return const Center(
                    child: Text('No liked photos yet!'),
                  );
                }
                return ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: likedPhotos.length,
                  itemBuilder: (context, index) {
                    final likedPhoto = likedPhotos[index];
                    return Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: context.mqw * .01),
                      child: SizedBox(
                        width: 100,
                        child: NetworkImageWidget(
                          boxFit: BoxFit.contain,
                          imageUrl: likedPhoto,
                        ),
                      ),
                    );
                  },
                );
              }),
            );
          }),

          SpacerWidget(
            height: .1,
          ),
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

class ImageOrIconButtonWidget extends StatelessWidget {
  const ImageOrIconButtonWidget({
    super.key,
    this.icon,
    this.image,
    required this.isIcon,
    required this.onTap,
  });

  final IconData? icon;
  final String? image;
  final bool isIcon;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final size = max(context.mqw * 0.03, context.mqh * 0.03);
    return GestureDetector(
      onTap: onTap,
      child: isIcon
          ? Icon(
              icon,
              size: size,
              color: AppColors.black,
            )
          : Image.asset(
              image ?? 'assets/icons/search.png',
              height: context.mqh * 0.026,
              color: AppColors.black,
            ),
    );
  }
}
