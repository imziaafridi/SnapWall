import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/data/response/api_response.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';
import 'package:snapwall/modules/home/repository/pixels_api_repo/pixels_api_repository_imp.dart';

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

  final TextEditingController searchEditingController = TextEditingController();
  @override
  void onInit() {
    fetchTrendingPhotos(); // Fetch data when the controller is initialized
    super.onInit();
  }
}
