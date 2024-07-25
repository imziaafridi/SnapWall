import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'configs/routes/navBar/nav_bar.dart';

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

      //   initialBinding: BindingsBuilder(() {
      //   Get.put(NavBarController());
      //   Get.put(AnotherController());
      //   // Add more controllers here
      // }),
    );
  }
}
