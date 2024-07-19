import 'package:snapwall/core/consts/api_key.dart';
import 'package:snapwall/core/consts/pixel_api_urls.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';

import '../../data/network/network_api_services.dart';

import 'pixels_api_repository.dart';

/// Implementation of [PixelsApiRepository] for making HTTP requests to fetch movies list.
class PixelsApiRepositoryImp implements PixelsApiRepository {
  final _apiServices = NetworkApiService();

  @override
  Future<Photos> fetchPhotosList() async {
    final response =
        await _apiServices.getApi(PixelApiUrls.TRENDING_URL, headers);
    return Photos.fromJson(response);
  }

  @override
  Future<Photos> fetchSearchPhotos(dynamic data) async {
    final response = await _apiServices.getApi(
        '${PixelApiUrls.SEARCH_URL}?query=$data', headers);
    return Photos.fromJson(response);
  }
}
