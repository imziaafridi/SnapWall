import 'package:snapwall/modules/search/models/search_photos_model.dart';

/// Abstract class defining methods for pixels API repositories.
abstract class PixelsCategSearchApiRepository {
  Future<PhotosSearchModel> fetchCategSearchPhotos({
    required String categ,
    required int page,
  });
}
