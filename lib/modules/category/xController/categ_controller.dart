import 'package:get/get.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snapwall/data/response/api_response.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';
import 'package:snapwall/modules/search/pixels_api_repo/pixels_search_api_repository_imp.dart';

class CategXController extends GetxController {
  final PixelsSearchApiRepositoryImp _pixelsApiRepositoryImp =
      PixelsSearchApiRepositoryImp();

  Rx<ApiResponse<PhotosSearchModel>> categTappedPhotos =
      ApiResponse<PhotosSearchModel>.loading().obs;

  void _setSearchedPhotos(
      ApiResponse<PhotosSearchModel> updatedCategTappedPhotos) {
    categTappedPhotos.value = updatedCategTappedPhotos;
  }

  // categories logic
  Future fetchCategPhotos(String category) async {
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
}
