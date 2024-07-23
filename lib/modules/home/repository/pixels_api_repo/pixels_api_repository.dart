import 'package:snapwall/modules/home/models/trend_photos_model.dart';

/// Abstract class defining methods for movies API repositories.
abstract class PixelsApiRepository {
  /// Fetches the list of movies from the API.
  ///
  /// Returns a [MovieListModel] representing the list of movies.
  Future<Photos> fetchPhotosList();
  // Future<Photos> fetchSearchPhotos(dynamic data);
}
