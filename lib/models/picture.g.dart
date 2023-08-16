// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picture.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Picture _$$_PictureFromJson(Map<String, dynamic> json) => _$_Picture(
      albumId: json['albumId'] as int,
      id: json['id'] as int,
      title: json['title'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$$_PictureToJson(_$_Picture instance) =>
    <String, dynamic>{
      'albumId': instance.albumId,
      'id': instance.id,
      'title': instance.title,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
