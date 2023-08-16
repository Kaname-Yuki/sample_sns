import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/models/picture.dart';
import 'package:sample_sns/repositories/picture.dart';
import 'package:sample_sns/repositories/common_parts.dart';

// 非同期関数の結果を利用するため、FutureProvider を使用
final pictureListProvider = FutureProvider.family<List<Picture>, int?>(
  (ref, albumId) async {
    return await getPictureList(albumId: albumId);
  },
);
final favoritePicturesProvider =
    ChangeNotifierProvider<FavoritePictureNotifier>(
        (ref) => FavoritePictureNotifier());

class FavoritePictureNotifier extends ChangeNotifier {
  List<Picture> favoritePictureList = [];

  Future getFavoritePictureList() async {
    final allalbums = await getPictureList();
    await Future.forEach(allalbums, (Picture item) async {
      final isFavorite = await getFavorite('picture', item.id);
      if (isFavorite) {
        favoritePictureList.add(item);
      }
    });
    notifyListeners();
  }

  void removeMypageFavorite(int id) {
    final removedItem =
        favoritePictureList.firstWhere((element) => element.id == id);
    favoritePictureList.remove(removedItem);
    notifyListeners();
  }
}
