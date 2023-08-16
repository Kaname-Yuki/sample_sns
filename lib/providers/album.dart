import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/models/album.dart';
import 'package:sample_sns/repositories/album.dart';
import 'package:sample_sns/repositories/picture.dart';
import 'package:sample_sns/repositories/common_parts.dart';

// 非同期関数の結果を利用するため、FutureProvider を使用
final albumListProvider = FutureProvider<List<Album>>(
  (ref) async {
    return await getAlbumList();
  },
);
final backImgProvider = ChangeNotifierProvider.family<BackImgNotifier, int>(
  (ref, albumId) {
    return BackImgNotifier(albumId: albumId);
  },
);

class BackImgNotifier extends ChangeNotifier {
  final int albumId;
  String imgUrl = '';

  BackImgNotifier({
    required this.albumId,
  });

  Future getBackImg() async {
    final backImg = await getPictureList(albumId: albumId);
    imgUrl = backImg[0].thumbnailUrl;
    notifyListeners();
  }
}

final favoriteAlbumsProvider = ChangeNotifierProvider<FavoriteAlbumNotifier>(
    (ref) => FavoriteAlbumNotifier());

class FavoriteAlbumNotifier extends ChangeNotifier {
  List<Album> favoriteAlbumList = [];

  Future getFavoriteAlbumList() async {
    final allalbums = await getAlbumList();
    await Future.forEach(allalbums, (Album item) async {
      final isFavorite = await getFavorite('album', item.id);
      if (isFavorite) {
        favoriteAlbumList.add(item);
      }
    });
    notifyListeners();
  }

  void removeMypageFavorite(int id) {
    final removedItem =
        favoriteAlbumList.firstWhere((element) => element.id == id);
    favoriteAlbumList.remove(removedItem);
    notifyListeners();
  }
}
