import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/body_text_widget.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/core/consts/pixels_categs_images.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/category/parts/snapwall_categ_detail_view.dart';
import 'package:snapwall/modules/category/xController/categ_controller.dart';
import 'package:snapwall/modules/home/pages/home/parts/network_cache_image.dart';
import 'package:snapwall/modules/home/pages/home/parts/snapwall_home_header_view.dart';

class SnapWallCategoriesView extends StatelessWidget {
  SnapWallCategoriesView({super.key});

  final CategXController _categXController = Get.put(
    CategXController(),
  );

  final Map<String, String> categLabelImages = {
    'Nature': PixelsCategsImages.NATURE_NETWRK, // 0
    'Beauty': PixelsCategsImages.BEAUTY_NETWRK, // 1
    'Fashion': PixelsCategsImages.FASHION_NETWRK, // 2
    'Real Estate': PixelsCategsImages.REAL_ESTATE_NETWRK, // 3
    'Sports & Fitness': PixelsCategsImages.SPORTS_AND_FITNESS_NETWRK, // 4
    'Travel & Tourism': PixelsCategsImages.TRAVEL_AND_TOURISM_NETWRK, // 5
    'Art & Entertainment': PixelsCategsImages.Art_AND_ENTERTAINMENT_NETWRK, // 6
    'Education & Learning':
        PixelsCategsImages.EDUCATION_AND_LEARNING_NETWRK, // 7
    'Health & Wellness': PixelsCategsImages.HEALTH_AND_WELLNESS_NETWRK, // 8
    'Baby & Kids': PixelsCategsImages.BABY_AND_KIDS_NETWRK, // 9
  };
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.whiteColor,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // header section
            const SnapWallHeaderView(
              title1: 'Snapwall',
              title2: '\tCollections',
              navTabIndexIconImgBtn1: 2,
              navTabIndexIconImgBtn2: 3,
              title1Color: AppColors.grey,
              title2Color: AppColors.red,
              title2FontWeight: FontWeight.w500,
              isIcon1: false,
              isIcon2: true,
              image1: 'assets/icons/search.png',
              icon2: CupertinoIcons.heart,
            ),
            // const LogoTextWidget(
            //   title1: 'Snapwall',
            //   title2: '\tCollections',
            //   title2Color: AppColors.red,
            //   title1Color: AppColors.grey,
            //   title2FontWeight: FontWeight.w500,
            // ),

            const ScreenProportionBox(
              height: .02,
            ),

            // categories section view
            Expanded(
              child: ListView.builder(
                itemCount: categLabelImages.length ?? 0,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  String categLabel = categLabelImages.keys.elementAt(index);
                  String categImage = categLabelImages.values.elementAt(index);
                  return GestureDetector(
                    onTap: () async {
                      debugPrint('categ image $categImage');
                      debugPrint('categ label $categLabel');
                      try {
                        await _categXController.fetchCategPhotos(categLabel);
                        // debugPrint(
                        //     'keyword: ${searchXContoller.searchedPhotos.value.data?.page}');
                        Get.to(
                          SnapWallCategDetailView(
                            categXController: _categXController,
                            keywordCateg: categLabel,
                          ),
                        );
                      } catch (e) {
                        debugPrint('Error: $e');
                        // Handle the error or show an error message to the user
                      }
                    },
                    child: Stack(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          height: context.mqh * .2,
                          child: NetworkCacheImage(
                            imageUrl: categImage,
                            borderRadius: 20.0,
                          ).paddingSymmetric(
                            vertical: context.mqh * .01,
                          ),
                        ),
                        Positioned(
                          right: 0,
                          // top: 0,
                          left: 0,
                          bottom: context.mqh * .01,
                          child: Center(
                            child: GlassMorphism(
                              blur: 5.0,
                              opacity: .16,
                              child: BodyTextWidget(
                                title: categLabel,
                                color: AppColors.whiteColor,
                                fontSize: 12.5,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ).paddingSymmetric(
          horizontal: context.mqw * .04,
          vertical: context.mqh * .04,
        ),
      ),
    );
  }
}
