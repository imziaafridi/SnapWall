import 'package:snapwall/modules/search/models/search_photos_model.dart';

/// Abstract class defining methods for movies API repositories.
abstract class PixelsSearchApiRepository {
  /// Fetches the list of movies from the API.
  ///
  /// Returns a [MovieListModel] representing the list of movies.
  Future<PhotosSearchModel> fetchSearchPhotos(dynamic data);
}
