import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/components/components_exports.dart';
import 'package:snapwall/configs/components/glass_morphism.dart';
import 'package:snapwall/modules/home/pages/home/home.dart';
import 'package:snapwall/modules/search/pages/search_wallpaper_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'S N A P W A L L',

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),

      home: NavBar(),

      //     initialBinding: BindingsBuilder(() {
      //   Get.put(NavBarController());
      //   Get.put(AnotherController());
      //   // Add more controllers here
      // }),
    );
  }
}

class CategoriesWallpapersView extends StatelessWidget {
  const CategoriesWallpapersView({super.key});
// static const categ = RoutesName.categ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HeadingTextWidget(title: 'Categories Wallpapers'),
      ),
    );
  }
}

class FavouritesWallpapersView extends StatelessWidget {
  const FavouritesWallpapersView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: HeadingTextWidget(title: 'Favourites Wallpapers'),
      ),
    );
  }
}

class NavBar extends StatelessWidget {
  final NavBarController navBarController = Get.put(NavBarController());

  final List<Widget> tabsViews = [
    const Home(),
    const CategoriesWallpapersView(),
    const SearchWallpapersView(),
    const FavouritesWallpapersView(),
  ];

  NavBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() => tabsViews[navBarController.currentIndex]),
      bottomNavigationBar: Container(
        margin: const EdgeInsets.all(6),
        child: GlassMorphism(
          blur: 8,
          opacity: .2,
          bgPaint: Colors.amber,
          child: Obx(() => NavigationBar(
                backgroundColor: Colors.transparent,
                destinations: const [
                  NavigationDestination(icon: Icon(Icons.home), label: 'Home'),
                  NavigationDestination(
                      icon: Icon(Icons.category), label: 'category'),
                  NavigationDestination(
                      icon: Icon(Icons.search), label: 'search'),
                  NavigationDestination(
                      icon: Icon(Icons.favorite), label: 'favourite'),
                ],
                selectedIndex: navBarController.currentIndex,
                animationDuration: const Duration(milliseconds: 1000),
                onDestinationSelected: navBarController.jumpTo,
              )),
        ),
      ),
    );
  }
}

class NavBarController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  void jumpTo(int index) => _currentIndex.value = index;
}
