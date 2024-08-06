import 'package:snapwall/core/consts/api_key.dart';
import 'package:snapwall/core/consts/pixel_api_urls.dart';
import 'package:snapwall/data/network/network_api_services.dart';
import 'package:snapwall/modules/search/models/search_photos_model.dart';

import 'pixels_search_api_repository.dart';

/// Implementation of [PixelsCategSearchApiRepository] for making HTTP requests to fetch movies list.
class PixelsCategSearchApiRepositoryImp
    implements PixelsCategSearchApiRepository {
  final _apiServices = NetworkApiService();

  @override
  Future<PhotosSearchModel> fetchCategSearchPhotos({
    required String categ,
    required int page,
  }) async {
    final response = await _apiServices.getApi(
      PixelApiUrls.SEARCH_URL +
          PixelApiUrls.query +
          PixelApiUrls.equalTo +
          categ +
          PixelApiUrls.nd +
          PixelApiUrls.page +
          PixelApiUrls.equalTo +
          PixelApiUrls.getPage(page),
      headers,
    );
    return PhotosSearchModel.fromJson(response);
  }
}
