import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'picture.freezed.dart';
part 'picture.g.dart';

@freezed
class Picture with _$Picture {
  factory Picture({
    required int albumId,
    required int id,
    required String title,
    required String url,
    required String thumbnailUrl,
  }) = _Picture;

  factory Picture.fromJson(Map<String, Object?> json) =>
      _$PictureFromJson(json);
}
