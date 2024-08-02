import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/components/custom_image_or_icon_button.dart';
import 'package:snapwall/configs/components/logo_text_widget.dart';
import 'package:snapwall/configs/routes/navBar/nav_bar_controller.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class SnapWallHeaderView extends StatelessWidget {
  const SnapWallHeaderView({
    super.key,
    required this.title1,
    required this.title2,
    // required this.onTap1IconImg,
    // required this.onTap2IconImg,
    this.title1Color,
    this.title2Color,
    this.title2FontWeight,
    this.textDecoration,
    this.sizeIconImg,
    this.title1FontWeight,
    required this.isIcon1,
    required this.isIcon2,
    this.image1,
    this.icon2,
    this.image2,
    this.icon1,
    this.onTap1,
    this.onTap2,
    this.navTabIndexIconImgBtn1,
    this.navTabIndexIconImgBtn2,
  });

  final String title1;
  final String title2;
  final Color? title1Color;
  final Color? title2Color;
  final FontWeight? title1FontWeight;

  final FontWeight? title2FontWeight;
  final TextDecoration? textDecoration;
  // final void Function() onTap1IconImg;
  // final void Function() onTap2IconImg;
  final double? sizeIconImg;
  final int? navTabIndexIconImgBtn1;
  final int? navTabIndexIconImgBtn2;
  final bool isIcon1;
  final bool isIcon2;
  final String? image1;
  final String? image2;
  final IconData? icon1;
  final IconData? icon2;
  final void Function()? onTap1;
  final void Function()? onTap2;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        LogoTextWidget(
          title1: title1,
          title2: title2,
          title1Color: title1Color ?? AppColors.grey,
          title2Color: title2Color ?? AppColors.black,
          title1FontWeight: title1FontWeight ?? FontWeight.normal,
          title2FontWeight: title2FontWeight ?? FontWeight.normal,
          textDecoration: textDecoration ?? TextDecoration.none,
        ),
        const Spacer(),
        10.w,
        CustomImageOrIconButton(
          imageUrl: image1,
          iconData: icon1,
          isIcon: isIcon1,
          size: sizeIconImg ?? 25,
          onTap: onTap1 ??
              () {
                final controller = Get.find<NavBarXController>();
                controller.jumpTo(
                  navTabIndexIconImgBtn1 ?? 0,
                ); // jumping to search tab
              },
        ),
        10.w,
        CustomImageOrIconButton(
          // iconData: CupertinoIcons.square_grid_2x2,
          imageUrl: image2,
          iconData: icon2,
          isIcon: isIcon2,
          size: sizeIconImg ?? 25,
          onTap: onTap2 ??
              () {
                final controller = Get.find<NavBarXController>();
                controller.jumpTo(
                  navTabIndexIconImgBtn2 ?? 1,
                ); // jumping to categ tab
              },
        ),
      ],
    );
  }
}
