import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/models/post.dart';
import 'package:sample_sns/repositories/post.dart';
import 'package:sample_sns/repositories/common_parts.dart';

// 非同期関数の結果を利用するため、FutureProvider を使用
final postListProvider = FutureProvider<List<Post>>(
  (ref) async {
    return await getPostList();
  },
);
final favoritePostsProvider = ChangeNotifierProvider<FavoritePostNotifier>(
    (ref) => FavoritePostNotifier());

class FavoritePostNotifier extends ChangeNotifier {
  List<Post> favoritePostList = [];

  Future getFavoritePostList() async {
    final allposts = await getPostList();
    await Future.forEach(allposts, (Post item) async {
      final isFavorite = await getFavorite('post', item.id);
      if (isFavorite) {
        favoritePostList.add(item);
      }
    });
    notifyListeners();
  }

  void removeMypageFavorite(int id) {
    final removedItem =
        favoritePostList.firstWhere((element) => element.id == id);
    favoritePostList.remove(removedItem);
    notifyListeners();
  }
}
