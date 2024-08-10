import 'package:snapwall/modules/search/models/search_photos_model.dart';

/// Abstract class defining methods for pixels API repositories.
abstract class PixelsSearchApiRepository {
  Future<PhotosSearchModel> fetchSearchPhotos(dynamic data, int page);
}
