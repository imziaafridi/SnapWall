// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'trend_photos_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PhotosModel _$PhotosModelFromJson(Map<String, dynamic> json) {
  return _PhotosModel.fromJson(json);
}

/// @nodoc
mixin _$PhotosModel {
  int get id => throw _privateConstructorUsedError;
  int get width => throw _privateConstructorUsedError;
  int get height => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get photographer => throw _privateConstructorUsedError;
  String get photographerUrl => throw _privateConstructorUsedError;
  String get avgColor => throw _privateConstructorUsedError;
  @JsonKey(name: 'src')
  SrcModel get src => throw _privateConstructorUsedError;
  bool get liked => throw _privateConstructorUsedError;
  String get alt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotosModelCopyWith<PhotosModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosModelCopyWith<$Res> {
  factory $PhotosModelCopyWith(
          PhotosModel value, $Res Function(PhotosModel) then) =
      _$PhotosModelCopyWithImpl<$Res, PhotosModel>;
  @useResult
  $Res call(
      {int id,
      int width,
      int height,
      String url,
      String photographer,
      String photographerUrl,
      String avgColor,
      @JsonKey(name: 'src') SrcModel src,
      bool liked,
      String alt});

  $SrcModelCopyWith<$Res> get src;
}

/// @nodoc
class _$PhotosModelCopyWithImpl<$Res, $Val extends PhotosModel>
    implements $PhotosModelCopyWith<$Res> {
  _$PhotosModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? width = null,
    Object? height = null,
    Object? url = null,
    Object? photographer = null,
    Object? photographerUrl = null,
    Object? avgColor = null,
    Object? src = null,
    Object? liked = null,
    Object? alt = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      photographer: null == photographer
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String,
      photographerUrl: null == photographerUrl
          ? _value.photographerUrl
          : photographerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      avgColor: null == avgColor
          ? _value.avgColor
          : avgColor // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as SrcModel,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $SrcModelCopyWith<$Res> get src {
    return $SrcModelCopyWith<$Res>(_value.src, (value) {
      return _then(_value.copyWith(src: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PhotosModelImplCopyWith<$Res>
    implements $PhotosModelCopyWith<$Res> {
  factory _$$PhotosModelImplCopyWith(
          _$PhotosModelImpl value, $Res Function(_$PhotosModelImpl) then) =
      __$$PhotosModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      int width,
      int height,
      String url,
      String photographer,
      String photographerUrl,
      String avgColor,
      @JsonKey(name: 'src') SrcModel src,
      bool liked,
      String alt});

  @override
  $SrcModelCopyWith<$Res> get src;
}

/// @nodoc
class __$$PhotosModelImplCopyWithImpl<$Res>
    extends _$PhotosModelCopyWithImpl<$Res, _$PhotosModelImpl>
    implements _$$PhotosModelImplCopyWith<$Res> {
  __$$PhotosModelImplCopyWithImpl(
      _$PhotosModelImpl _value, $Res Function(_$PhotosModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? width = null,
    Object? height = null,
    Object? url = null,
    Object? photographer = null,
    Object? photographerUrl = null,
    Object? avgColor = null,
    Object? src = null,
    Object? liked = null,
    Object? alt = null,
  }) {
    return _then(_$PhotosModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      width: null == width
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as int,
      height: null == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as int,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      photographer: null == photographer
          ? _value.photographer
          : photographer // ignore: cast_nullable_to_non_nullable
              as String,
      photographerUrl: null == photographerUrl
          ? _value.photographerUrl
          : photographerUrl // ignore: cast_nullable_to_non_nullable
              as String,
      avgColor: null == avgColor
          ? _value.avgColor
          : avgColor // ignore: cast_nullable_to_non_nullable
              as String,
      src: null == src
          ? _value.src
          : src // ignore: cast_nullable_to_non_nullable
              as SrcModel,
      liked: null == liked
          ? _value.liked
          : liked // ignore: cast_nullable_to_non_nullable
              as bool,
      alt: null == alt
          ? _value.alt
          : alt // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotosModelImpl implements _PhotosModel {
  const _$PhotosModelImpl(
      {this.id = 0,
      this.width = 0,
      this.height = 0,
      this.url = '',
      this.photographer = '',
      this.photographerUrl = '',
      this.avgColor = '',
      @JsonKey(name: 'src') required this.src,
      this.liked = false,
      this.alt = ''});

  factory _$PhotosModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotosModelImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final int width;
  @override
  @JsonKey()
  final int height;
  @override
  @JsonKey()
  final String url;
  @override
  @JsonKey()
  final String photographer;
  @override
  @JsonKey()
  final String photographerUrl;
  @override
  @JsonKey()
  final String avgColor;
  @override
  @JsonKey(name: 'src')
  final SrcModel src;
  @override
  @JsonKey()
  final bool liked;
  @override
  @JsonKey()
  final String alt;

  @override
  String toString() {
    return 'PhotosModel(id: $id, width: $width, height: $height, url: $url, photographer: $photographer, photographerUrl: $photographerUrl, avgColor: $avgColor, src: $src, liked: $liked, alt: $alt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.width, width) || other.width == width) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.photographer, photographer) ||
                other.photographer == photographer) &&
            (identical(other.photographerUrl, photographerUrl) ||
                other.photographerUrl == photographerUrl) &&
            (identical(other.avgColor, avgColor) ||
                other.avgColor == avgColor) &&
            (identical(other.src, src) || other.src == src) &&
            (identical(other.liked, liked) || other.liked == liked) &&
            (identical(other.alt, alt) || other.alt == alt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, width, height, url,
      photographer, photographerUrl, avgColor, src, liked, alt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosModelImplCopyWith<_$PhotosModelImpl> get copyWith =>
      __$$PhotosModelImplCopyWithImpl<_$PhotosModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotosModelImplToJson(
      this,
    );
  }
}

abstract class _PhotosModel implements PhotosModel {
  const factory _PhotosModel(
      {final int id,
      final int width,
      final int height,
      final String url,
      final String photographer,
      final String photographerUrl,
      final String avgColor,
      @JsonKey(name: 'src') required final SrcModel src,
      final bool liked,
      final String alt}) = _$PhotosModelImpl;

  factory _PhotosModel.fromJson(Map<String, dynamic> json) =
      _$PhotosModelImpl.fromJson;

  @override
  int get id;
  @override
  int get width;
  @override
  int get height;
  @override
  String get url;
  @override
  String get photographer;
  @override
  String get photographerUrl;
  @override
  String get avgColor;
  @override
  @JsonKey(name: 'src')
  SrcModel get src;
  @override
  bool get liked;
  @override
  String get alt;
  @override
  @JsonKey(ignore: true)
  _$$PhotosModelImplCopyWith<_$PhotosModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SrcModel _$SrcModelFromJson(Map<String, dynamic> json) {
  return _SrcModel.fromJson(json);
}

/// @nodoc
mixin _$SrcModel {
  String get original => throw _privateConstructorUsedError;
  String get large2x => throw _privateConstructorUsedError;
  String get large => throw _privateConstructorUsedError;
  String get medium => throw _privateConstructorUsedError;
  String get small => throw _privateConstructorUsedError;
  String get portrait => throw _privateConstructorUsedError;
  String get landscape => throw _privateConstructorUsedError;
  String get tiny => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SrcModelCopyWith<SrcModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SrcModelCopyWith<$Res> {
  factory $SrcModelCopyWith(SrcModel value, $Res Function(SrcModel) then) =
      _$SrcModelCopyWithImpl<$Res, SrcModel>;
  @useResult
  $Res call(
      {String original,
      String large2x,
      String large,
      String medium,
      String small,
      String portrait,
      String landscape,
      String tiny});
}

/// @nodoc
class _$SrcModelCopyWithImpl<$Res, $Val extends SrcModel>
    implements $SrcModelCopyWith<$Res> {
  _$SrcModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? large2x = null,
    Object? large = null,
    Object? medium = null,
    Object? small = null,
    Object? portrait = null,
    Object? landscape = null,
    Object? tiny = null,
  }) {
    return _then(_value.copyWith(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      large2x: null == large2x
          ? _value.large2x
          : large2x // ignore: cast_nullable_to_non_nullable
              as String,
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      portrait: null == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String,
      landscape: null == landscape
          ? _value.landscape
          : landscape // ignore: cast_nullable_to_non_nullable
              as String,
      tiny: null == tiny
          ? _value.tiny
          : tiny // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SrcModelImplCopyWith<$Res>
    implements $SrcModelCopyWith<$Res> {
  factory _$$SrcModelImplCopyWith(
          _$SrcModelImpl value, $Res Function(_$SrcModelImpl) then) =
      __$$SrcModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String original,
      String large2x,
      String large,
      String medium,
      String small,
      String portrait,
      String landscape,
      String tiny});
}

/// @nodoc
class __$$SrcModelImplCopyWithImpl<$Res>
    extends _$SrcModelCopyWithImpl<$Res, _$SrcModelImpl>
    implements _$$SrcModelImplCopyWith<$Res> {
  __$$SrcModelImplCopyWithImpl(
      _$SrcModelImpl _value, $Res Function(_$SrcModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? original = null,
    Object? large2x = null,
    Object? large = null,
    Object? medium = null,
    Object? small = null,
    Object? portrait = null,
    Object? landscape = null,
    Object? tiny = null,
  }) {
    return _then(_$SrcModelImpl(
      original: null == original
          ? _value.original
          : original // ignore: cast_nullable_to_non_nullable
              as String,
      large2x: null == large2x
          ? _value.large2x
          : large2x // ignore: cast_nullable_to_non_nullable
              as String,
      large: null == large
          ? _value.large
          : large // ignore: cast_nullable_to_non_nullable
              as String,
      medium: null == medium
          ? _value.medium
          : medium // ignore: cast_nullable_to_non_nullable
              as String,
      small: null == small
          ? _value.small
          : small // ignore: cast_nullable_to_non_nullable
              as String,
      portrait: null == portrait
          ? _value.portrait
          : portrait // ignore: cast_nullable_to_non_nullable
              as String,
      landscape: null == landscape
          ? _value.landscape
          : landscape // ignore: cast_nullable_to_non_nullable
              as String,
      tiny: null == tiny
          ? _value.tiny
          : tiny // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SrcModelImpl implements _SrcModel {
  const _$SrcModelImpl(
      {this.original = '',
      this.large2x = '',
      this.large = '',
      this.medium = '',
      this.small = '',
      this.portrait = '',
      this.landscape = '',
      this.tiny = ''});

  factory _$SrcModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SrcModelImplFromJson(json);

  @override
  @JsonKey()
  final String original;
  @override
  @JsonKey()
  final String large2x;
  @override
  @JsonKey()
  final String large;
  @override
  @JsonKey()
  final String medium;
  @override
  @JsonKey()
  final String small;
  @override
  @JsonKey()
  final String portrait;
  @override
  @JsonKey()
  final String landscape;
  @override
  @JsonKey()
  final String tiny;

  @override
  String toString() {
    return 'SrcModel(original: $original, large2x: $large2x, large: $large, medium: $medium, small: $small, portrait: $portrait, landscape: $landscape, tiny: $tiny)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SrcModelImpl &&
            (identical(other.original, original) ||
                other.original == original) &&
            (identical(other.large2x, large2x) || other.large2x == large2x) &&
            (identical(other.large, large) || other.large == large) &&
            (identical(other.medium, medium) || other.medium == medium) &&
            (identical(other.small, small) || other.small == small) &&
            (identical(other.portrait, portrait) ||
                other.portrait == portrait) &&
            (identical(other.landscape, landscape) ||
                other.landscape == landscape) &&
            (identical(other.tiny, tiny) || other.tiny == tiny));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, original, large2x, large, medium,
      small, portrait, landscape, tiny);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SrcModelImplCopyWith<_$SrcModelImpl> get copyWith =>
      __$$SrcModelImplCopyWithImpl<_$SrcModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SrcModelImplToJson(
      this,
    );
  }
}

abstract class _SrcModel implements SrcModel {
  const factory _SrcModel(
      {final String original,
      final String large2x,
      final String large,
      final String medium,
      final String small,
      final String portrait,
      final String landscape,
      final String tiny}) = _$SrcModelImpl;

  factory _SrcModel.fromJson(Map<String, dynamic> json) =
      _$SrcModelImpl.fromJson;

  @override
  String get original;
  @override
  String get large2x;
  @override
  String get large;
  @override
  String get medium;
  @override
  String get small;
  @override
  String get portrait;
  @override
  String get landscape;
  @override
  String get tiny;
  @override
  @JsonKey(ignore: true)
  _$$SrcModelImplCopyWith<_$SrcModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Photos _$PhotosFromJson(Map<String, dynamic> json) {
  return _Photos.fromJson(json);
}

/// @nodoc
mixin _$Photos {
  int get page => throw _privateConstructorUsedError;
  int get perPage => throw _privateConstructorUsedError;
  @JsonKey(name: 'photos')
  List<PhotosModel> get photos => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PhotosCopyWith<Photos> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhotosCopyWith<$Res> {
  factory $PhotosCopyWith(Photos value, $Res Function(Photos) then) =
      _$PhotosCopyWithImpl<$Res, Photos>;
  @useResult
  $Res call(
      {int page,
      int perPage,
      @JsonKey(name: 'photos') List<PhotosModel> photos});
}

/// @nodoc
class _$PhotosCopyWithImpl<$Res, $Val extends Photos>
    implements $PhotosCopyWith<$Res> {
  _$PhotosCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? perPage = null,
    Object? photos = null,
  }) {
    return _then(_value.copyWith(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _value.photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotosModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PhotosImplCopyWith<$Res> implements $PhotosCopyWith<$Res> {
  factory _$$PhotosImplCopyWith(
          _$PhotosImpl value, $Res Function(_$PhotosImpl) then) =
      __$$PhotosImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int page,
      int perPage,
      @JsonKey(name: 'photos') List<PhotosModel> photos});
}

/// @nodoc
class __$$PhotosImplCopyWithImpl<$Res>
    extends _$PhotosCopyWithImpl<$Res, _$PhotosImpl>
    implements _$$PhotosImplCopyWith<$Res> {
  __$$PhotosImplCopyWithImpl(
      _$PhotosImpl _value, $Res Function(_$PhotosImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? page = null,
    Object? perPage = null,
    Object? photos = null,
  }) {
    return _then(_$PhotosImpl(
      page: null == page
          ? _value.page
          : page // ignore: cast_nullable_to_non_nullable
              as int,
      perPage: null == perPage
          ? _value.perPage
          : perPage // ignore: cast_nullable_to_non_nullable
              as int,
      photos: null == photos
          ? _value._photos
          : photos // ignore: cast_nullable_to_non_nullable
              as List<PhotosModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PhotosImpl implements _Photos {
  const _$PhotosImpl(
      {this.page = 1,
      this.perPage = 1,
      @JsonKey(name: 'photos') final List<PhotosModel> photos = const []})
      : _photos = photos;

  factory _$PhotosImpl.fromJson(Map<String, dynamic> json) =>
      _$$PhotosImplFromJson(json);

  @override
  @JsonKey()
  final int page;
  @override
  @JsonKey()
  final int perPage;
  final List<PhotosModel> _photos;
  @override
  @JsonKey(name: 'photos')
  List<PhotosModel> get photos {
    if (_photos is EqualUnmodifiableListView) return _photos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_photos);
  }

  @override
  String toString() {
    return 'Photos(page: $page, perPage: $perPage, photos: $photos)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PhotosImpl &&
            (identical(other.page, page) || other.page == page) &&
            (identical(other.perPage, perPage) || other.perPage == perPage) &&
            const DeepCollectionEquality().equals(other._photos, _photos));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, page, perPage, const DeepCollectionEquality().hash(_photos));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PhotosImplCopyWith<_$PhotosImpl> get copyWith =>
      __$$PhotosImplCopyWithImpl<_$PhotosImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PhotosImplToJson(
      this,
    );
  }
}

abstract class _Photos implements Photos {
  const factory _Photos(
      {final int page,
      final int perPage,
      @JsonKey(name: 'photos') final List<PhotosModel> photos}) = _$PhotosImpl;

  factory _Photos.fromJson(Map<String, dynamic> json) = _$PhotosImpl.fromJson;

  @override
  int get page;
  @override
  int get perPage;
  @override
  @JsonKey(name: 'photos')
  List<PhotosModel> get photos;
  @override
  @JsonKey(ignore: true)
  _$$PhotosImplCopyWith<_$PhotosImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
