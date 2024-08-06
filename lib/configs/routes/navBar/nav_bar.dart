import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/color/color.dart';
import 'package:snapwall/configs/routes/navBar/nav_bar_controller.dart';
import 'package:snapwall/configs/routes/navBar/tabs.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';

class NavBar extends StatelessWidget {
  final NavBarXController navBarController = Get.put(
    NavBarXController(),
  );

  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.whiteColor,
      body: Obx(
        () => tabsViews[navBarController.currentIndex],
      ),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(
          6,
        ),
        child: Obx(
          () => ClipRRect(
            borderRadius: BorderRadius.circular(
              18,
            ),
            child: NavigationBar(
              destinations: const [
                NavigationDestination(
                  icon: Icon(
                    CupertinoIcons.house,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.house_fill,
                  ),
                  label: 'Home',
                ),
                NavigationDestination(
                  icon: Icon(
                    CupertinoIcons.square_grid_2x2,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.square_grid_2x2_fill,
                  ),
                  label: 'category',
                ),
                NavigationDestination(
                  icon: Icon(
                    CupertinoIcons.search,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.doc_text_search,
                  ),
                  label: 'search',
                ),
                NavigationDestination(
                  icon: Icon(
                    CupertinoIcons.heart,
                  ),
                  selectedIcon: Icon(
                    CupertinoIcons.heart_fill,
                  ),
                  label: 'favourite',
                ),
              ],
              selectedIndex: navBarController.currentIndex,
              animationDuration: const Duration(
                milliseconds: 500,
              ),
              onDestinationSelected: navBarController.jumpTo,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              surfaceTintColor: AppColors.whiteColor,
              backgroundColor: Colors.grey[200],
              height: context.mqh * .08,
              elevation: 0.0,

              // indicatorColor: AppColors.black,
              // indicatorShape: RoundedRectangleBorder(),
              // shadowColor: AppColors.grey,
            ),
          ),
        ),
      ),
    );
  }
}
