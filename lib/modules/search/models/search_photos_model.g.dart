// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SrcPhotosSearchModelImpl _$$SrcPhotosSearchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SrcPhotosSearchModelImpl(
      original: json['original'] as String? ?? '',
      large2x: json['large2x'] as String? ?? '',
      large: json['large'] as String? ?? '',
      medium: json['medium'] as String? ?? '',
      small: json['small'] as String? ?? '',
      portrait: json['portrait'] as String? ?? '',
      landscape: json['landscape'] as String? ?? '',
      tiny: json['tiny'] as String? ?? '',
    );

Map<String, dynamic> _$$SrcPhotosSearchModelImplToJson(
        _$SrcPhotosSearchModelImpl instance) =>
    <String, dynamic>{
      'original': instance.original,
      'large2x': instance.large2x,
      'large': instance.large,
      'medium': instance.medium,
      'small': instance.small,
      'portrait': instance.portrait,
      'landscape': instance.landscape,
      'tiny': instance.tiny,
    };

_$PhotosDetailsSearchModelImpl _$$PhotosDetailsSearchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PhotosDetailsSearchModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      width: (json['width'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      url: json['url'] as String? ?? '',
      photographer: json['photographer'] as String? ?? '',
      photographer_url: json['photographer_url'] as String? ?? '',
      photographer_id: (json['photographer_id'] as num?)?.toInt() ?? 0,
      avg_color: json['avg_color'] as String? ?? '',
      src: SrcPhotosSearchModel.fromJson(json['src'] as Map<String, dynamic>),
      liked: json['liked'] as bool? ?? false,
      alt: json['alt'] as String? ?? '',
    );

Map<String, dynamic> _$$PhotosDetailsSearchModelImplToJson(
        _$PhotosDetailsSearchModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographer_url': instance.photographer_url,
      'photographer_id': instance.photographer_id,
      'avg_color': instance.avg_color,
      'src': instance.src,
      'liked': instance.liked,
      'alt': instance.alt,
    };

_$PhotosSearchModelImpl _$$PhotosSearchModelImplFromJson(
        Map<String, dynamic> json) =>
    _$PhotosSearchModelImpl(
      page: (json['page'] as num?)?.toInt() ?? 0,
      per_page: (json['per_page'] as num?)?.toInt() ?? 0,
      photos: (json['photos'] as List<dynamic>)
          .map((e) =>
              PhotosDetailsSearchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      total_results: (json['total_results'] as num?)?.toInt() ?? 0,
      next_page: json['next_page'] as String? ?? '',
    );

Map<String, dynamic> _$$PhotosSearchModelImplToJson(
        _$PhotosSearchModelImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'per_page': instance.per_page,
      'photos': instance.photos,
      'total_results': instance.total_results,
      'next_page': instance.next_page,
    };
