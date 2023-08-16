import 'dart:convert' as convert;
import 'package:sample_sns/models/user.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

const url = 'https://jsonplaceholder.typicode.com';

// JSONPlaceholder のユーザー情報を取得
Future<List<User>> getUsers() async {
  final response = await http.get(
    Uri.parse('$url/users'),
  );

  // ステータスコードが 200（成功）か確認
  if (response.statusCode == 200) {
    // レスポンスの中身（``response.body``）を Dart オブジェクトに変換
    final List<dynamic> userData = convert.jsonDecode(response.body);
    // freezed で生成された fromJson() メソッドを呼び出して Post クラスのインスタンスを作成
    // ここでは userData がリスト形式なので、fromJson() の後に toList() が必要
    final userList = userData.map((e) => User.fromJson(e)).toList();
    return Future<List<User>>.value(userList);
  } else {
    throw Exception('Failed to fetch data');
  }
}

Future<String> getUserName() async {
  final data = await SharedPreferences.getInstance();
  final username = data.getString('username');
  return username == null ? Future.value('ゲスト') : Future.value(username);
}

void setUserName(String username) async {
  final data = await SharedPreferences.getInstance();
  data.setString('username', username);
}
