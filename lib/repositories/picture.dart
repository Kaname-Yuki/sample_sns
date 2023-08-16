import 'dart:convert' as convert;
import 'package:sample_sns/models/picture.dart';
import 'package:http/http.dart' as http;

const url = 'https://jsonplaceholder.typicode.com';

Future<List<Picture>> getPictureList({int? albumId}) async {
  final List<Picture> pictureList;
  final queryParam = albumId == null ? '' : '?albumId=$albumId';
  final response = await http.get(
    Uri.parse('$url/photos$queryParam'),
  );
  if (response.statusCode == 200) {
    final List<dynamic> pictureData = convert.jsonDecode(response.body);
    pictureList = pictureData.map((e) => Picture.fromJson(e)).toList();
    return Future<List<Picture>>.value(pictureList);
  } else {
    throw Exception('Failed to fetch data');
  }
}
