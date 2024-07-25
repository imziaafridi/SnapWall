import 'package:get/get.dart';

class NavBarXController extends GetxController {
  final RxInt _currentIndex = 0.obs;

  int get currentIndex => _currentIndex.value;

  void jumpTo(int index) => _currentIndex.value = index;
}
