import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/core/utils/extensions/general_ectensions.dart';
import 'package:snapwall/modules/home/pages/home/home.dart';
import 'package:snapwall/modules/search/pages/search_wallpaper_view.dart';

import '../../modules/home/pages/home/parts/trend_wallpapers.dart';
import 'routes_name.dart';

// Routes
class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RoutesName.home:
        return GetPageRoute(
          page: () => const Home(),
          transition: Transition.zoom,
        );

      case RoutesName.categ:
        return GetPageRoute(
          // routeName: RoutesName.categ,
          page: () => const SearchWallpapersView(),
          transition: Transition.fadeIn,
        );

      default:
        return GetPageRoute(
          routeName: '/error',
          page: () => const Scaffold(
            body: Center(
              child: Text('No route defined'),
            ),
          ),
          transition: Transition.fadeIn,
        );
    }
  }
}
