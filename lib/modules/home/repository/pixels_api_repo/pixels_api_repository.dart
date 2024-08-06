import 'package:snapwall/modules/home/models/trend_photos_model.dart';

/// Abstract class defining methods for movies API repositories.
abstract class PixelsApiRepository {
  /// Fetches the list of photos from the API.

  Future<Photos> fetchPhotosList({
    required int page,
  });
}
