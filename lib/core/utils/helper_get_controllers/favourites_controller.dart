import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavouritesXController extends GetxController {
  Rx<List<String>> likedPhotos = Rx<List<String>>(
    [],
  );

  void toggleFavourite(String photoSrc) {
    if (likedPhotos.value.contains(photoSrc)) {
      likedPhotos.value.remove(photoSrc);
    } else {
      likedPhotos.value.add(photoSrc);
    }
    // Notify listeners about the change
    likedPhotos.refresh();
    debugPrint(
      'liked list: ${likedPhotos.value}',
    );
  }

  bool isFavourite(String photoSrc) {
    return likedPhotos.value.contains(photoSrc);
  }
}
