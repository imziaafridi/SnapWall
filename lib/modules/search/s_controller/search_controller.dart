import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/data/response/api_response.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';
import 'package:snapwall/modules/search/pixels_api_repo/pixels_search_api_repository_imp.dart';

class SearchXContoller extends GetxController {
  final PixelsSearchApiRepositoryImp _pixelsApiRepositoryImp =
      PixelsSearchApiRepositoryImp();

  Rx<ApiResponse<PhotosSearchModel>> searchedPhotos =
      ApiResponse<PhotosSearchModel>.loading().obs;
  final RxString searchText = ''.obs; // Observable to track search text

  Rx<bool> isSearchedTaped = false.obs;

  void _setSearchedPhotos(ApiResponse<PhotosSearchModel> updatedCategPhotos) {
    searchedPhotos.value = updatedCategPhotos;
  }

  // categories logic
  Future fetchSearchedPhotos(String category) async {
    _setSearchedPhotos(ApiResponse.loading());
    _pixelsApiRepositoryImp.fetchSearchPhotos(category).then((data) {
      // Process the fetched data to remove duplicates
      List<PhotosDetailsSearchModel> uniquePhotos =
          data.photos.toSet().toList();
      PhotosSearchModel uniquePhotosData = data.copyWith(photos: uniquePhotos);

      _setSearchedPhotos(
        ApiResponse.completed(data),
      );
      GetUtils.snakeCase('search data fetch successfully: $uniquePhotosData');
      debugPrint('search data fetch successfully: $uniquePhotosData');
    }).onError((error, stackTrace) {
      _setSearchedPhotos(ApiResponse.error(error.toString()));
      GetUtils.snakeCase('search data fetch failed: $error');
      debugPrint('search data fetch failed: $error');
    });
  }

// debounce for onchaged textFieled for auto searching wallpapers with optimised version of code thats why we used debouncer for that to not call when not needed
  Timer? _debounceTimer;

  void onSearchTextChanged(String text) {
    // if (_debounceTimer != null) {
    //   _debounceTimer?.cancel();
    // }
    _debounceTimer?.cancel();
    _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
      searchText.value = text;
      fetchSearchedPhotos(text);
      isSearchedTaped.value = true;
    });
  }
}
// var categList = [s
//   'Nature',
//   'People',
//   'Business & Work',
//   'Technology',
//   'Animals',
//   'Travel',
//   'Architecture',
//   'Arts & Culture',
//   'Food & Drink',
//   'Health & Wellness',
// ];
