import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/heading_text_widget.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class SnapWallCategoriesView extends StatelessWidget {
  const SnapWallCategoriesView({super.key});

  // final SearchXContoller searchXContoller = Get.put(
  //   SearchXContoller(),
  // );

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header section
            HeadingTextWidget(
              title: 'Collections',
            ),
            // categories section view
            // ListView.builder(
            //   itemCount:
            //       searchXContoller.searchedPhotos.value.data?.photos.length ??
            //           0,
            //   physics: const ScrollPhysics(),
            //   itemBuilder: (context, index) {
            //     PhotosDetailsSearchModel? categ =
            //         searchXContoller.searchedPhotos.value.data?.photos[index];
            //     return NetworkCacheImage(
            //       imageUrl: categ?.src.portrait ?? '',
            //     );
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
