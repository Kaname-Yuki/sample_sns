import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/models/user.dart';
import 'package:sample_sns/repositories/user.dart';

// 投稿・アルバムの投稿者情報表示に使用
final userListProvider = FutureProvider<List<User>>(
  (ref) async {
    return await getUsers();
  },
);
final usernameProvider = StateProvider((ref) => 'ゲスト');
