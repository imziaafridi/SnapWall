import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/body_text_widget.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/configs/components/logo_text_widget.dart';
import 'package:snapwall/core/consts/pixels_categs_images.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class SnapWallCategoriesView extends StatelessWidget {
  SnapWallCategoriesView({super.key});

  final SearchXContoller searchXContoller = Get.put(
    SearchXContoller(),
  );

  final Map<String, String> categLabelImages = {
    'Nature': PixelsCategsImages.NATURE,
    'Beauty': PixelsCategsImages.BEAUTY,
    'Fashion': PixelsCategsImages.FASHION,
    'Real Estate': PixelsCategsImages.REAL_ESTATE,
    'Sports & Fitness': PixelsCategsImages.SPORTS_AND_FITNESS,
    'Travel & Tourism': PixelsCategsImages.TRAVEL_AND_TOURISM,
    'Art & Entertainment': PixelsCategsImages.Art_AND_ENTERTAINMENT,
    'Education & Learning': PixelsCategsImages.EDUCATION_AND_LEARNING,
    'Health & Wellness': PixelsCategsImages.HEALTH_AND_WELLNESS,
    'Baby & Kids': PixelsCategsImages.BABY_AND_KIDS,
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
            const LogoTextWidget(
              title1: 'Snapwall',
              title2: '\tCollections',
              title2Color: AppColors.red,
              title1Color: AppColors.grey,
              title2FontWeight: FontWeight.w500,
            ),
            // categories section view

            Expanded(
              child: ListView.builder(
                itemCount: categLabelImages.length ?? 0,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  String categLabel = categLabelImages.keys.elementAt(index);
                  String categImage = categLabelImages.values.elementAt(index);
                  return Stack(
                    children: [
                      SizedBox(
                        width: double.infinity,
                        height: context.mqh * .2,
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(20),
                          ),
                          child: AssetImageWithShimmer(
                            assetPath: categImage,
                          ).paddingSymmetric(
                            vertical: context.mqh * .01,
                          ),
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
                              color: AppColors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.normal,
                            ),
                          ),
                        ),
                      ),
                    ],
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

class AssetImageWithShimmer extends StatelessWidget {
  const AssetImageWithShimmer({
    super.key,
    required this.assetPath,
    this.width,
    this.height,
  });

  final String assetPath;
  final double? width;
  final double? height;

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      assetPath,
      fit: BoxFit.cover,
      width: width,
      height: height,
      frameBuilder: (context, child, frame, loading) => loading
          ? Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: child,
            )
          : child,
    );
  }
}
