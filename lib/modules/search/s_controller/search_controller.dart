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

  void _setSearchedPhotos(ApiResponse<PhotosSearchModel> updatedCategPhotos) {
    searchedPhotos.value = updatedCategPhotos;
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
      GetUtils.snakeCase('data fetch successfully: $uniquePhotosData');
      debugPrint('data fetch successfully: $uniquePhotosData');
    }).onError((error, stackTrace) {
      _setSearchedPhotos(ApiResponse.error(error.toString()));
      GetUtils.snakeCase('data fetch failed: $error');
      debugPrint('data fetch failed: $error');
    });
  }

  final TextEditingController searchController = TextEditingController();

  @override
  void onClose() {
    searchController.dispose(); // Dispose of the controller here
    super.onClose();
  }
}

// var categList = [
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
