import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/components/custom_image_or_icon_button.dart';
import 'package:snapwall/configs/components/logo_text_widget.dart';
import 'package:snapwall/configs/routes/navBar/nav_bar_controller.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class SnapWallHomeHeaderView extends StatelessWidget {
  const SnapWallHomeHeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const LogoTextWidget(
          title1: 'Snap',
          title2: 'Wall',
        ),
        const Spacer(),
        10.w,
        CustomImageOrIconButton(
          imageUrl: 'assets/icons/search.png',
          isIcon: false,
          size: 25,
          onTap: () {
            final controller = Get.find<NavBarXController>();
            controller.jumpTo(
              2,
            ); // jumping to search tab
            debugPrint('search pressed!');
          },
        ),
        10.w,
        CustomImageOrIconButton(
          iconData: CupertinoIcons.square_grid_2x2,
          isIcon: true,
          size: 25,
          onTap: () {
            final controller = Get.find<NavBarXController>();
            controller.jumpTo(
              1,
            ); // jumping to categ tab
            debugPrint('categ pressed!');
          },
        ),
      ],
    );
  }
}
