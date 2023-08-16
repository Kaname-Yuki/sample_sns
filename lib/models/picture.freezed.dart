// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'picture.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Picture _$PictureFromJson(Map<String, dynamic> json) {
  return _Picture.fromJson(json);
}

/// @nodoc
mixin _$Picture {
  int get albumId => throw _privateConstructorUsedError;
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PictureCopyWith<Picture> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PictureCopyWith<$Res> {
  factory $PictureCopyWith(Picture value, $Res Function(Picture) then) =
      _$PictureCopyWithImpl<$Res, Picture>;
  @useResult
  $Res call(
      {int albumId, int id, String title, String url, String thumbnailUrl});
}

/// @nodoc
class _$PictureCopyWithImpl<$Res, $Val extends Picture>
    implements $PictureCopyWith<$Res> {
  _$PictureCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumId = null,
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_value.copyWith(
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PictureCopyWith<$Res> implements $PictureCopyWith<$Res> {
  factory _$$_PictureCopyWith(
          _$_Picture value, $Res Function(_$_Picture) then) =
      __$$_PictureCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int albumId, int id, String title, String url, String thumbnailUrl});
}

/// @nodoc
class __$$_PictureCopyWithImpl<$Res>
    extends _$PictureCopyWithImpl<$Res, _$_Picture>
    implements _$$_PictureCopyWith<$Res> {
  __$$_PictureCopyWithImpl(_$_Picture _value, $Res Function(_$_Picture) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? albumId = null,
    Object? id = null,
    Object? title = null,
    Object? url = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_$_Picture(
      albumId: null == albumId
          ? _value.albumId
          : albumId // ignore: cast_nullable_to_non_nullable
              as int,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Picture with DiagnosticableTreeMixin implements _Picture {
  _$_Picture(
      {required this.albumId,
      required this.id,
      required this.title,
      required this.url,
      required this.thumbnailUrl});

  factory _$_Picture.fromJson(Map<String, dynamic> json) =>
      _$$_PictureFromJson(json);

  @override
  final int albumId;
  @override
  final int id;
  @override
  final String title;
  @override
  final String url;
  @override
  final String thumbnailUrl;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'Picture(albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'Picture'))
      ..add(DiagnosticsProperty('albumId', albumId))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('title', title))
      ..add(DiagnosticsProperty('url', url))
      ..add(DiagnosticsProperty('thumbnailUrl', thumbnailUrl));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Picture &&
            (identical(other.albumId, albumId) || other.albumId == albumId) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, albumId, id, title, url, thumbnailUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PictureCopyWith<_$_Picture> get copyWith =>
      __$$_PictureCopyWithImpl<_$_Picture>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PictureToJson(
      this,
    );
  }
}

abstract class _Picture implements Picture {
  factory _Picture(
      {required final int albumId,
      required final int id,
      required final String title,
      required final String url,
      required final String thumbnailUrl}) = _$_Picture;

  factory _Picture.fromJson(Map<String, dynamic> json) = _$_Picture.fromJson;

  @override
  int get albumId;
  @override
  int get id;
  @override
  String get title;
  @override
  String get url;
  @override
  String get thumbnailUrl;
  @override
  @JsonKey(ignore: true)
  _$$_PictureCopyWith<_$_Picture> get copyWith =>
      throw _privateConstructorUsedError;
}
