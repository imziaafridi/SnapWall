import 'package:flutter/material.dart';
import 'package:snapwall/modules/category/snapwall_categories_view.dart';
import 'package:snapwall/modules/favourites/snapwall_favourites_view.dart';
import 'package:snapwall/modules/home/pages/home/home.dart';
import 'package:snapwall/modules/search/pages/search_wallpaper_view.dart';

final List<Widget> tabsViews = [
  const SnapWallHomeView(),
  SnapWallCategoriesView(),
  SearchWallpapersView(),
  SnapWallFavouritesView(),
];
