import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:snapwall/modules/home/data/response/response.dart';
import 'package:snapwall/modules/home/repository/movies_api/pixels_repository.dart';

import '../models/trend_photos_model.dart';

class HomeController extends GetxController {
  final PixelsApiRepositoryImp _pixelsApiRepositoryImp =
      PixelsApiRepositoryImp();

  Rx<ApiResponse<Photos>> trendPhotos = ApiResponse<Photos>.loading().obs;

  void _setTrendingPhotos(ApiResponse<Photos> updatedTrendPhotos) {
    trendPhotos.value = updatedTrendPhotos;
  }

  Future fetchTrendingPhotos() async {
    _setTrendingPhotos(ApiResponse.loading());
    _pixelsApiRepositoryImp.fetchPhotosList().then((data) {
      // Process the fetched data to remove duplicates
      List<PhotosModel> uniquePhotos = data.photos.toSet().toList();
      Photos uniquePhotosData = data.copyWith(photos: uniquePhotos);

      _setTrendingPhotos(ApiResponse.completed(uniquePhotosData));
      GetUtils.snakeCase('data fetch successfully: $uniquePhotosData');
      debugPrint('data fetch successfully: $uniquePhotosData');
    }).onError((error, stackTrace) {
      _setTrendingPhotos(ApiResponse.error(error.toString()));
      GetUtils.snakeCase('data fetch failed: $error');
      debugPrint('data fetch failed: $error');
    });
  }

  Rx<List<String>> likedPhotos = Rx<List<String>>([]);
  Rx<bool> isLiked = Rx<bool>(false);

  void toggleFavourite(String photoSrc) {
    if (likedPhotos.value.contains(photoSrc)) {
      likedPhotos.value.remove(photoSrc);
    } else {
      likedPhotos.value.add(photoSrc);
    }
    // Notify listeners about the change
    likedPhotos.refresh();
    debugPrint('liked list: ${likedPhotos.value}');
  }

  bool isFavourite(String photoSrc) {
    return likedPhotos.value.contains(photoSrc);
  }

  // // categories  logic
  // Future fetchSearchingPhotos(List<String> data) async {
  //   _setTrendingPhotos(ApiResponse.loading());
  //   _pixelsApiRepositoryImp.fetchSearchPhotos(data).then((data) {
  //     // Process the fetched data to remove duplicates
  //     List<PhotosModel> uniquePhotos = data.photos.toSet().toList();
  //     Photos uniquePhotosData = data.copyWith(photos: uniquePhotos);

  //     _setTrendingPhotos(ApiResponse.completed(uniquePhotosData));
  //     GetUtils.snakeCase('data fetch successfully: $uniquePhotosData');
  //     debugPrint('data fetch successfully: $uniquePhotosData');
  //   }).onError((error, stackTrace) {
  //     _setTrendingPhotos(ApiResponse.error(error.toString()));
  //     GetUtils.snakeCase('data fetch failed: $error');
  //     debugPrint('data fetch failed: $error');
  //   });
  // }

  @override
  void onInit() {
    fetchTrendingPhotos(); // Fetch data when the controller is initialized
    super.onInit();
  }
}
