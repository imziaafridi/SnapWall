import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:snapwall/data/response/api_response.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';
import 'package:snapwall/modules/home/repository/pixels_api_repo/pixels_api_repository_imp.dart';

class TrendXController extends GetxController {
  final PixelsApiRepositoryImp _pixelsApiRepositoryImp =
      PixelsApiRepositoryImp();

  Rx<ApiResponse<List<PhotosModel>>> trendPhotos =
      ApiResponse<List<PhotosModel>>.loading().obs;
  final TextEditingController searchEditingController = TextEditingController();

  // pagination dec..
  int _page = 1;
  final Rx<bool> _isLoadingMore = false.obs;
  final ScrollController _scrollController = ScrollController();

  void _setTrendingPhotos(ApiResponse<List<PhotosModel>> updatedTrendPhotos) {
    if (trendPhotos.value.data != null &&
        updatedTrendPhotos.data != null &&
        _page > 1) {
      trendPhotos.value = ApiResponse.completed(
        trendPhotos.value.data! + updatedTrendPhotos.data!,
      );
    } else if (updatedTrendPhotos.data != null && _page == 1) {
      trendPhotos.value = updatedTrendPhotos;
    }
  }

  Future fetchTrendingPhotos() async {
    if (_isLoadingMore.value) return;
    _isLoadingMore.value = true;
    _setTrendingPhotos(ApiResponse.loading());
    _pixelsApiRepositoryImp
        .fetchPhotosList(
      page: _page,
    )
        .then((data) {
      // Process the fetched data to remove duplicates
      List<PhotosModel> uniquePhotos = data.photos.toSet().toList();

      // if (_page == 1) {
      _setTrendingPhotos(ApiResponse.completed(uniquePhotos));
      // } else {
      //   _setTrendingPhotos(
      //     ApiResponse.completed(trendPhotos.value.data =
      //         (trendPhotos.value.data ?? []) + uniquePhotos),
      //   );
      // }

      _page++;
      _isLoadingMore.value = false;
      GetUtils.snakeCase('data fetch successfully: $uniquePhotos');
      debugPrint('data fetch successfully: $uniquePhotos');
      debugPrint('load more data fetch successfully: ${trendPhotos.value}');
    }).onError(
      (error, stackTrace) {
        _setTrendingPhotos(ApiResponse.error(error.toString()));
        _isLoadingMore.value = false;
        GetUtils.snakeCase('data fetch failed: $error');
        debugPrint('data fetch failed: $error');
      },
    );
  }

  void _scrollListener() {
    if (_isLoadingMore.value) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      Future.delayed(const Duration(milliseconds: 1000), () {
        fetchTrendingPhotos();
      });
    }
  }

  @override
  void onInit() {
    _scrollController.addListener(_scrollListener);
    fetchTrendingPhotos(); // Fetch data when the controller is initialized
    super.onInit();
  }

  // Bring page to default state or refresh
  Future refreshTrendingPhotos() async {
    _page = 1;
    trendPhotos.value = ApiResponse.loading(); // or ApiResponse.initial()
    trendPhotos.value.data?.clear();
    await fetchTrendingPhotos();
  }

// dismissed
  @override
  void dispose() {
    _scrollController.dispose();
    searchEditingController.dispose();
    super.dispose();
  }

// getters
  ScrollController get scrollController => _scrollController;
  Rx<bool> get loadMore => _isLoadingMore;
  int get page => _page;
}

// class TrendXController extends GetxController {
//   final PixelsApiRepositoryImp _pixelsApiRepositoryImp =
//       PixelsApiRepositoryImp();

//   Rx<ApiResponse<Photos>> trendPhotos = ApiResponse<Photos>.loading().obs;

//   void _setTrendingPhotos(ApiResponse<Photos> updatedTrendPhotos) {
//     trendPhotos.value = updatedTrendPhotos;
//   }

//   Future fetchTrendingPhotos() async {
//     _setTrendingPhotos(ApiResponse.loading());
//     _pixelsApiRepositoryImp.fetchPhotosList().then((data) {
//       // Process the fetched data to remove duplicates
//       List<PhotosModel> uniquePhotos = data.photos.toSet().toList();
//       Photos uniquePhotosData = data.copyWith(photos: uniquePhotos);

//       _setTrendingPhotos(ApiResponse.completed(uniquePhotosData));
//       GetUtils.snakeCase('data fetch successfully: $uniquePhotosData');
//       debugPrint('data fetch successfully: $uniquePhotosData');
//     }).onError((error, stackTrace) {
//       _setTrendingPhotos(ApiResponse.error(error.toString()));
//       GetUtils.snakeCase('data fetch failed: $error');
//       debugPrint('data fetch failed: $error');
//     });
//   }

//   final TextEditingController searchEditingController = TextEditingController();
//   @override
//   void onInit() {
//     fetchTrendingPhotos(); // Fetch data when the controller is initialized
//     super.onInit();
//   }
// }
