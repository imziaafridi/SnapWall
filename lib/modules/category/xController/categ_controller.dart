import 'package:get/get.dart';

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snapwall/data/response/api_response.dart';
import 'package:snapwall/modules/category/pixels_categ_search_api_repo/pixels_categ_search_api_repository_imp.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';

class CategXController extends GetxController {
  final PixelsCategSearchApiRepositoryImp _pixelsApiRepositoryImp =
      PixelsCategSearchApiRepositoryImp();

  Rx<ApiResponse<List<PhotosDetailsSearchModel>>> categSearchPhotosList =
      ApiResponse<List<PhotosDetailsSearchModel>>.loading().obs;

  // pagination

  final Rx<String> _categLabel = Rx<String>('');

  int _pageCategSearch = 1;
  final Rx<bool> _isLoadingMoreCategSearch = false.obs;
  final ScrollController _scrollControllerCategSearch = ScrollController();

  void _setCategSearchedPhotos(
      ApiResponse<List<PhotosDetailsSearchModel>>
          updatedCategSearchPhotosList) {
    if (categSearchPhotosList.value.data != null &&
        updatedCategSearchPhotosList.data != null &&
        page > 1) {
      categSearchPhotosList.value = ApiResponse.completed(
        categSearchPhotosList.value.data! + updatedCategSearchPhotosList.data!,
      );
    } else if (updatedCategSearchPhotosList.data != null && page == 1) {
      categSearchPhotosList.value = updatedCategSearchPhotosList;
    }
  }

  // categories logic
  Future fetchCategSearchPhotosData(String category) async {
    if (_isLoadingMoreCategSearch.value) return;
    _isLoadingMoreCategSearch.value = true;
    _setCategSearchedPhotos(ApiResponse.loading());
    _pixelsApiRepositoryImp
        .fetchCategSearchPhotos(categ: category, page: _pageCategSearch)
        .then(
      (data) {
        // Process the fetched data to remove duplicates
        List<PhotosDetailsSearchModel> uniqueCategSearchPhotos =
            data.photos.toSet().toList();
        // PhotosSearchModel uniquePhotosData =
        //     data.copyWith(photos: uniquePhotos);

        // if (_pageCategSearch == 1) {
        _setCategSearchedPhotos(
          ApiResponse.completed(uniqueCategSearchPhotos),
        );
        // } else {
        //   _setCategSearchedPhotos(
        //     ApiResponse.completed(
        //       categSearchPhotosList.value.data =
        //           (categSearchPhotosList.value.data ?? []) +
        //               uniqueCategSearchPhotos,
        //     ),
        //   );
        // }

        _pageCategSearch++;
        _isLoadingMoreCategSearch.value = false;

        GetUtils.snakeCase(
            'search data fetch successfully: $uniqueCategSearchPhotos');
        debugPrint('search data fetch successfully: $uniqueCategSearchPhotos');
      },
    ).onError(
      (error, stackTrace) {
        _setCategSearchedPhotos(ApiResponse.error(error.toString()));
        _isLoadingMoreCategSearch.value = false;
        GetUtils.snakeCase('search data fetch failed: $error');
        debugPrint('search data fetch failed: $error');
      },
    );
  }

// scroll controller
  final isScrollingToTop = RxBool(false);

  void scrollListenerCateg() {
    if (_isLoadingMoreCategSearch.value) return;
    if (_scrollControllerCategSearch.position.pixels ==
        _scrollControllerCategSearch.position.maxScrollExtent) {
      Future.delayed(
        const Duration(milliseconds: 1000),
        () {
          fetchCategSearchPhotosData(_categLabel.value);
        },
      );
    }
  }

// scroll
  final _scrollNotifier = ValueNotifier(0.0);

  @override
  void onInit() {
    _scrollControllerCategSearch.addListener(() {
      if (categLabel.value.isNotEmpty == true) {
        scrollListenerCateg();
      }
      _scrollNotifier.value = _scrollControllerCategSearch.offset;
    });
    if (categLabel.value.isNotEmpty == true) {
      fetchCategSearchPhotosData(_categLabel.value);
    } else {
      debugPrint('categ search is empty');
    }
    super.onInit();
  }

// Bring page to default state or refresh
  Future clearCategSearchPhotos() async {
    categSearchPhotosList.value.data?.clear();
    _pageCategSearch = 1; // Reset page to 1
    // Reset loadMore flag

    update(['categ_search_photos_list']);
  }

  @override
  void dispose() {
    _scrollControllerCategSearch.dispose();
    _scrollNotifier.dispose();
    super.dispose();
  }

  // getters
  ScrollController get scrollControllerCateg => _scrollControllerCategSearch;
  Rx<bool> get loadMoreCateg => _isLoadingMoreCategSearch;
  Rx<String> get categLabel => _categLabel;
  ValueNotifier<double> get scrollNotifier => _scrollNotifier;
  int get page => _pageCategSearch;
}
