library models;

import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_photos_model.g.dart';
part 'search_photos_model.freezed.dart';

@freezed
class SrcPhotosSearchModel with _$SrcPhotosSearchModel {
  const factory SrcPhotosSearchModel({
    @Default('') String original,
    @Default('') String large2x,
    @Default('') String large,
    @Default('') String medium,
    @Default('') String small,
    @Default('') String portrait,
    @Default('') String landscape,
    @Default('') String tiny,
  }) = _SrcPhotosSearchModel;

  factory SrcPhotosSearchModel.fromJson(Map<String, dynamic> json) =>
      _$SrcPhotosSearchModelFromJson(json);
}

@freezed
class PhotosDetailsSearchModel with _$PhotosDetailsSearchModel {
  const factory PhotosDetailsSearchModel({
    @Default(0) int id,
    @Default(0) int width,
    @Default(0) int height,
    @Default('') String url,
    @Default('') String photographer,
    @Default('') String photographer_url,
    @Default(0) int photographer_id,
    @Default('') String avg_color,
    @JsonKey(name: 'src') required SrcPhotosSearchModel src,
    @Default(false) bool liked,
    @Default('') String alt,
  }) = _PhotosDetailsSearchModel;

  factory PhotosDetailsSearchModel.fromJson(Map<String, dynamic> json) =>
      _$PhotosDetailsSearchModelFromJson(json);
}

@freezed
class PhotosSearchModel with _$PhotosSearchModel {
  const factory PhotosSearchModel({
    @Default(0) int page,
    @Default(0) int per_page,
    @JsonKey(name: 'photos') required List<PhotosDetailsSearchModel> photos,
    @Default(0) int total_results,
    @Default('') String next_page,
  }) = _PhotosSearchModel;

  factory PhotosSearchModel.fromJson(Map<String, dynamic> json) =>
      _$PhotosSearchModelFromJson(json);
}
