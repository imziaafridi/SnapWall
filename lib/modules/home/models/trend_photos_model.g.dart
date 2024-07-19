// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trend_photos_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PhotosModelImpl _$$PhotosModelImplFromJson(Map<String, dynamic> json) =>
    _$PhotosModelImpl(
      id: (json['id'] as num?)?.toInt() ?? 0,
      width: (json['width'] as num?)?.toInt() ?? 0,
      height: (json['height'] as num?)?.toInt() ?? 0,
      url: json['url'] as String? ?? '',
      photographer: json['photographer'] as String? ?? '',
      photographerUrl: json['photographerUrl'] as String? ?? '',
      avgColor: json['avgColor'] as String? ?? '',
      src: SrcModel.fromJson(json['src'] as Map<String, dynamic>),
      liked: json['liked'] as bool? ?? false,
      alt: json['alt'] as String? ?? '',
    );

Map<String, dynamic> _$$PhotosModelImplToJson(_$PhotosModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'width': instance.width,
      'height': instance.height,
      'url': instance.url,
      'photographer': instance.photographer,
      'photographerUrl': instance.photographerUrl,
      'avgColor': instance.avgColor,
      'src': instance.src,
      'liked': instance.liked,
      'alt': instance.alt,
    };

_$SrcModelImpl _$$SrcModelImplFromJson(Map<String, dynamic> json) =>
    _$SrcModelImpl(
      original: json['original'] as String? ?? '',
      large2x: json['large2x'] as String? ?? '',
      large: json['large'] as String? ?? '',
      medium: json['medium'] as String? ?? '',
      small: json['small'] as String? ?? '',
      portrait: json['portrait'] as String? ?? '',
      landscape: json['landscape'] as String? ?? '',
      tiny: json['tiny'] as String? ?? '',
    );

Map<String, dynamic> _$$SrcModelImplToJson(_$SrcModelImpl instance) =>
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

_$PhotosImpl _$$PhotosImplFromJson(Map<String, dynamic> json) => _$PhotosImpl(
      page: (json['page'] as num?)?.toInt() ?? 1,
      perPage: (json['perPage'] as num?)?.toInt() ?? 1,
      photos: (json['photos'] as List<dynamic>?)
              ?.map((e) => PhotosModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$PhotosImplToJson(_$PhotosImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'perPage': instance.perPage,
      'photos': instance.photos,
    };
