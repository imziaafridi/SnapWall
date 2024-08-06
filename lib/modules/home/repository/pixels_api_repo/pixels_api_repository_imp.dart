import 'package:snapwall/core/consts/api_key.dart';
import 'package:snapwall/core/consts/pixel_api_urls.dart';
import 'package:snapwall/data/network/network_api_services.dart';
import 'package:snapwall/modules/home/models/trend_photos_model.dart';
import 'package:snapwall/modules/home/repository/pixels_api_repo/pixels_api_repository.dart';

/// Implementation of [PixelsApiRepository] for making HTTP requests to fetch movies list.
class PixelsApiRepositoryImp implements PixelsApiRepository {
  final _apiServices = NetworkApiService();

  @override
  Future<Photos> fetchPhotosList({
    required int page,
    int perPage = 15,
  }) async {
    final response = await _apiServices.getApi(
        PixelApiUrls.TRENDING_URL +
            PixelApiUrls.questionMark +
            PixelApiUrls.page +
            PixelApiUrls.equalTo +
            PixelApiUrls.getPage(page),
        headers);
    return Photos.fromJson(response);
  }
}
