import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/search/s_controller/search_controller.dart';

class AutoScrollUpButtonForSearchWidget extends StatelessWidget {
  const AutoScrollUpButtonForSearchWidget({
    super.key,
    required this.searchXContoller,
  });

  final SearchXContoller searchXContoller;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: searchXContoller.scrollNotifier,
      builder: (context, value, child) {
        return Positioned(
          bottom: context.mqh * .01,
          right: context.mqw * .02,
          child: AnimatedOpacity(
            opacity: value > 0 ? 1 : 0,
            duration: const Duration(milliseconds: 1000),
            child: GestureDetector(
              onTap: searchXContoller.loadMore.value
                  ? null
                  : () {
                      searchXContoller.isScrollingToTop.value = true;
                      searchXContoller.scrollController.animateTo(0,
                          duration: const Duration(milliseconds: 3000),
                          curve: Curves.easeInOut);
                      Future.delayed(const Duration(milliseconds: 3000), () {
                        searchXContoller.isScrollingToTop.value = false;
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
