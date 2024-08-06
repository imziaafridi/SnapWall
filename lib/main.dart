import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/configs/components/fade_transition_widget.dart';
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
      debugShowCheckedModeBanner: false,
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

// class TestingWidget extends StatelessWidget {
//   const TestingWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             FadeTransitionWidget(
//               delay: Duration(milliseconds: 1000),
//               // duration: Duration(milliseconds: 1000),
//               child: FlutterLogo(),
//             ),
//             FadeTransitionWidget(
//               delay: Duration(milliseconds: 3000),
//               // duration: Duration(milliseconds: 6000),
//               child: FlutterLogo(),
//             ),
//             FadeTransitionWidget(
//               delay: Duration(milliseconds: 5000),
//               // duration: Duration(milliseconds: 9000),
//               child: FlutterLogo(),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
