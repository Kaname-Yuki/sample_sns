import 'dart:convert' as convert;
import 'package:sample_sns/models/album.dart';
import 'package:http/http.dart' as http;

const url = 'https://jsonplaceholder.typicode.com';

// JSONPlaceholder のユーザー情報を取得
Future<List<Album>> getAlbumList() async {
  final response = await http.get(
    Uri.parse('$url/albums'),
  );

  // ステータスコードが 200（成功）か確認
  if (response.statusCode == 200) {
    // レスポンスの中身（``response.body``）を Dart オブジェクトに変換
    final List<dynamic> albumData = convert.jsonDecode(response.body);
    // freezed で生成された fromJson() メソッドを呼び出して Post クラスのインスタンスを作成
    // ここでは userData がリスト形式なので、fromJson() の後に toList() が必要
    final albumList = albumData.map((e) => Album.fromJson(e)).toList();
    return Future<List<Album>>.value(albumList);
  } else {
    throw Exception('Failed to fetch data');
  }
}
