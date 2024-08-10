// import 'dart:async';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:snapwall/data/response/api_response.dart';
// import 'package:snapwall/modules/search/models/search_photos_model.dart';
// import 'package:snapwall/modules/search/pixels_api_repo/pixels_search_api_repository_imp.dart';

// class SearchXController extends GetxController {
//   final PixelsSearchApiRepositoryImp _pixelsApiRepositoryImp =
//       PixelsSearchApiRepositoryImp();

//   final Rx<ApiResponse<List<PhotosDetailsSearchModel>>> _searchedPhotos =
//       ApiResponse<List<PhotosDetailsSearchModel>>.loading().obs;
//   final RxString searchText = ''.obs;
//   RxBool isSearchedTapped = false.obs;

//   // Pagination
//   int _page = 1;
//   final RxBool _isLoadingMore = false.obs;
//   final ScrollController _scrollController = ScrollController();

//   final TextEditingController textController = TextEditingController();
//   Timer? _debounceTimer;
//   final FocusNode _focusNode = FocusNode();
//   final ValueNotifier<double> _scrollNotifier = ValueNotifier(0.0);
//   final RxBool _isScrollingToTop = false.obs;
//   RxBool isFocused = false.obs;
//   //search btn bbol
//   RxBool isSearchedTaped = false.obs;

//   // Set searched photos with pagination
//   void _setSearchedPhotos(
//       ApiResponse<List<PhotosDetailsSearchModel>> updatedSearchedPhotos) {
//     if (_page > 1 &&
//         _searchedPhotos.value.data != null &&
//         updatedSearchedPhotos.data != null) {
//       _searchedPhotos.value = ApiResponse.completed(
//         _searchedPhotos.value.data! + updatedSearchedPhotos.data!,
//       );
//     } else {
//       _searchedPhotos.value = updatedSearchedPhotos;
//     }
//   }

//   Future<void> fetchSearchedPhotos(String search) async {
//     if (_isLoadingMore.value) return;

//     _isLoadingMore.value = true;
//     _setSearchedPhotos(ApiResponse.loading());

//     try {
//       final data =
//           await _pixelsApiRepositoryImp.fetchSearchPhotos(search, _page);
//       final uniquePhotos = data.photos.toSet().toList();
//       _setSearchedPhotos(ApiResponse.completed(uniquePhotos));
//       _page++;
//       debugPrint(
//           'Search data fetched successfully: ${uniquePhotos.length} items');
//     } catch (error) {
//       _setSearchedPhotos(ApiResponse.error(error.toString()));
//       debugPrint('Search data fetch failed: $error');
//     } finally {
//       _isLoadingMore.value = false;
//     }
//   }

//   void onSearchTextChanged(String query) {
//     if (query.isEmpty && searchText.value.isEmpty) return;

//     _debounceTimer?.cancel();
//     _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
//       searchText.value = query;
//       refreshSearchedPhotos(query);
//     });
//   }

//   Future<void> refreshSearchedPhotos(String query) async {
//     _page = 1;
//     _searchedPhotos.value = ApiResponse.loading();
//     await fetchSearchedPhotos(query);
//   }

//   void _scrollListener() {
//     if (_isLoadingMore.value) return;
//     if (_scrollController.position.pixels ==
//         _scrollController.position.maxScrollExtent) {
//       Future.delayed(
//         const Duration(milliseconds: 1000),
//         () {
//           fetchSearchedPhotos(searchText.value);
//         },
//       );
//     }
//   }

//   @override
//   void onInit() {
//     _scrollController.addListener(() {
//       _scrollListener();
//       _scrollNotifier.value = _scrollController.offset;
//       if (_scrollNotifier.value > 0) isFocused.value = false;
//       if (_focusNode.hasFocus) _focusNode.unfocus();

//       if (searchText.value.isNotEmpty) {
//         _scrollListener();
//       }
//     });

//     if (searchText.value.isNotEmpty) {
//       fetchSearchedPhotos(searchText.value);
//     }

//     super.onInit();
//   }

//   @override
//   void dispose() {
//     _scrollController.dispose();
//     _focusNode.dispose();
//     textController.dispose();
//     _debounceTimer?.cancel();
//     super.dispose();
//   }

//   // Getters
//   Rx<ApiResponse<List<PhotosDetailsSearchModel>>> get searchedPhotos =>
//       _searchedPhotos;
//   ValueNotifier<double> get scrollNotifier => _scrollNotifier;
//   RxBool get loadMore => _isLoadingMore;
//   ScrollController get scrollController => _scrollController;
//   FocusNode get focusNode => _focusNode;
//   int get page => _page;
//   RxBool get isScrollingToTop => _isScrollingToTop;
// }

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:snapwall/data/response/api_response.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';
import 'package:snapwall/modules/search/pixels_api_repo/pixels_search_api_repository_imp.dart';

class SearchXContoller extends GetxController {
  final PixelsSearchApiRepositoryImp _pixelsApiRepositoryImp =
      PixelsSearchApiRepositoryImp();

  final Rx<ApiResponse<List<PhotosDetailsSearchModel>>> _searchedPhotos =
      ApiResponse<List<PhotosDetailsSearchModel>>.loading().obs;
  final RxString searchText = ''.obs; // Observable to track search text

  Rx<bool> isSearchedTaped = false.obs;

  void _setSearchedPhotos(
      ApiResponse<List<PhotosDetailsSearchModel>> updatedSearchedPhotos) {
    if (_searchedPhotos.value.data != null &&
        updatedSearchedPhotos.data != null &&
        _page > 1) {
      _searchedPhotos.value = ApiResponse.completed(
        _searchedPhotos.value.data! + updatedSearchedPhotos.data!,
      );
    } else if (updatedSearchedPhotos.data != null && _page == 1) {
      _searchedPhotos.value = updatedSearchedPhotos;
    }
  }

  // pagination dec..
  int _page = 1;
  final Rx<bool> _isLoadingMore = false.obs;
  final ScrollController _scrollController = ScrollController();

  // categories logic
  Future fetchSearchedPhotos(String search) async {
    if (_isLoadingMore.value) return;
    _isLoadingMore.value = true;
    _setSearchedPhotos(ApiResponse.loading());
    _pixelsApiRepositoryImp.fetchSearchPhotos(search, _page).then((data) {
      List<PhotosDetailsSearchModel> uniquePhotos =
          data.photos.toSet().toList();

      _setSearchedPhotos(
        ApiResponse.completed(uniquePhotos),
      );

      _page++;
      _isLoadingMore.value = false;

      GetUtils.snakeCase(
          'search data fetch successfully: ${data.copyWith(photos: uniquePhotos)}');
      debugPrint(
          'search data fetch successfully: ${data.copyWith(photos: uniquePhotos)}');
    }).onError((error, stackTrace) {
      _setSearchedPhotos(ApiResponse.error(error.toString()));
      _isLoadingMore.value = false;
      GetUtils.snakeCase('search data fetch failed: $error');
      debugPrint('search data fetch failed: $error');
    });
  }

// debounce for onchaged textFieled for auto searching wallpapers with optimised version of code thats why we used debouncer for that to not call when not needed

  final TextEditingController textController = TextEditingController();
  Timer? _debounceTimer;

  void onSearchTextChanged(String query) {
    try {
      if (query.isEmpty && searchText.value.isEmpty) return;

      _debounceTimer?.cancel();
      _debounceTimer = Timer(const Duration(milliseconds: 1000), () {
        searchText.value = query;
        refreshSearchedPhotos(searchText.value);
        debugPrint('search-text: ${searchText.value}');
        debugPrint('search-query: $query');
      });
    } catch (e) {
      debugPrint('errror while auto-search: $e');
      throw Exception(e);
    }
  }

  // // Bring page to default state or refresh
  Future refreshSearchedPhotos(String query) async {
    _page = 1;
    searchedPhotos.value = ApiResponse.loading(); // or ApiResponse.initial()
    searchedPhotos.value.data?.clear();
    await fetchSearchedPhotos(query);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _focusNode.dispose();
    textController.dispose();
    _debounceTimer?.cancel();
    super.dispose();
  }

  // scroll
  final _scrollNotifier = ValueNotifier(0.0);
  final _isScrollingToTop = RxBool(false);

  void _scrollListener() {
    if (_isLoadingMore.value) return;
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      debugPrint('searched text: {searchText.value}');
      Future.delayed(const Duration(milliseconds: 1000), () {
        fetchSearchedPhotos(textController.text);
      });
    }
  }

// focusnode for textfield for unfocusing whin scroll
  final FocusNode _focusNode = FocusNode();
  var isFocused = false.obs;

  @override
  void onInit() {
    _scrollController.addListener(() {
      if (searchText.value.isNotEmpty == true) {
        _scrollListener();
      }
      _scrollNotifier.value = _scrollController.offset;
// for diable search and its insect view
      // if (_focusNode.hasFocus) {
      //   _focusNode.unfocus();
      //   isFocused.value = false;
      // }
      if (_scrollController.offset > 0) {
        isFocused.value = false;
        isSearchedTaped.value = false;
      }
    });

    if (searchText.value.isNotEmpty == true) {
      fetchSearchedPhotos(searchText.value);
    } else {
      debugPrint('search text empty;');
    }

    // toggle focus for text field

    super.onInit();
  }

  // getters
  Rx<ApiResponse<List<PhotosDetailsSearchModel>>> get searchedPhotos =>
      _searchedPhotos;
  ValueNotifier<double> get scrollNotifier => _scrollNotifier;
  Rx<bool> get loadMore => _isLoadingMore;
  ScrollController get scrollController => _scrollController;
  FocusNode get focusNode => _focusNode;
  int get page => _page;
  RxBool get isScrollingToTop => _isScrollingToTop;
}
