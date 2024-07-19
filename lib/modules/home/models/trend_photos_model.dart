import 'package:freezed_annotation/freezed_annotation.dart';

part 'trend_photos_model.g.dart';
part 'trend_photos_model.freezed.dart';

@freezed
class PhotosModel with _$PhotosModel {
  const factory PhotosModel({
    @Default(0) int id,
    @Default(0) int width,
    @Default(0) int height,
    @Default('') String url,
    @Default('') String photographer,
    @Default('') String photographerUrl,
    @Default('') String avgColor,
    @JsonKey(name: 'src') required SrcModel src,
    @Default(false) bool liked,
    @Default('') String alt,
  }) = _PhotosModel;

  factory PhotosModel.fromJson(Map<String, dynamic> json) =>
      _$PhotosModelFromJson(json);
}

@freezed
class SrcModel with _$SrcModel {
  const factory SrcModel({
    @Default('') String original,
    @Default('') String large2x,
    @Default('') String large,
    @Default('') String medium,
    @Default('') String small,
    @Default('') String portrait,
    @Default('') String landscape,
    @Default('') String tiny,
  }) = _SrcModel;

  factory SrcModel.fromJson(Map<String, dynamic> json) =>
      _$SrcModelFromJson(json);
}

@freezed
class Photos with _$Photos {
  const factory Photos({
    @Default(1) int page,
    @Default(1) int perPage,
    @Default([]) @JsonKey(name: 'photos') List<PhotosModel> photos,
  }) = _Photos;

  factory Photos.fromJson(Map<String, dynamic> json) => _$PhotosFromJson(json);
}
