import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/providers/common_parts.dart';
import 'package:sample_sns/repositories/common_parts.dart';
import 'package:tuple/tuple.dart';
import 'package:sample_sns/providers/picture.dart';
import 'package:sample_sns/providers/album.dart';
import 'package:sample_sns/providers/post.dart';
import 'package:sample_sns/repositories/picture.dart';

class FavoriteWidget extends ConsumerWidget {
  final String type;
  final int id;
  final bool isMypage;

  const FavoriteWidget({
    super.key,
    required this.type,
    required this.id,
    this.isMypage = false,
  });
  void _toggleFavorite(WidgetRef ref, Tuple2<String, int> itemInfo) async {
    ref.read(favoriteProvider(itemInfo)).setItemFavorite();
    if (type == 'album') {
      final newFavorites = await getPictureList(albumId: id);
      for (final item in newFavorites) {
        setFavorite(
          'picture',
          item.id,
          isFavorite: ref
              .read(
                favoriteProvider(itemInfo),
              )
              .isFavorite,
        );
      }
    }
    if (isMypage) {
      switch (type) {
        // 投稿かアルバムか写真かで場合分け
        case 'post':
          ref.read(favoritePostsProvider).removeMypageFavorite(id);
          break;
        case 'album':
          ref.read(favoriteAlbumsProvider).removeMypageFavorite(id);
          break;
        case 'picture':
          ref.read(favoritePicturesProvider).removeMypageFavorite(id);
          break;
      }
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemInfo = Tuple2<String, int>(type, id);
    final isInitialized = ref.watch(
        favoriteProvider(itemInfo).select((value) => value.isInitialized));
    if (!isInitialized) {
      ref.read(favoriteProvider(itemInfo)).getItemFavorite();
      return const Center(
        child: CircularProgressIndicator(),
      );
    }
    return IconButton(
      onPressed: () => _toggleFavorite(ref, itemInfo),
      icon: ref.watch(favoriteProvider(itemInfo)).isFavorite
          ? const Icon(Icons.favorite)
          : const Icon(Icons.favorite_border),
      color: Colors.pink,
    );
  }
}

class MyBottomNavigationBar extends ConsumerWidget {
  const MyBottomNavigationBar({Key? key}) : super(key: key);

  void toOtherPages(int index, BuildContext context, WidgetRef ref) {
    ref.read(currentTabProvider.state).update((state) => index);
    switch (index) {
      case 0:
        Navigator.of(context).pushNamed('/');
        break;
      case 1:
        Navigator.of(context).pushNamed('/albums');
        break;
      case 2:
        Navigator.of(context).pushNamed('/pictures');
        break;
      case 3:
        Navigator.of(context).pushNamed('/my_page');
        break;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return BottomNavigationBar(
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.speaker_notes),
          label: '投稿',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.collections),
          label: 'アルバム',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.image),
          label: '写真',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'ホーム',
        ),
      ],
      onTap: (index) => toOtherPages(index, context, ref),
      currentIndex: ref.watch(currentTabProvider),
      selectedItemColor: Colors.blue,
      unselectedItemColor: Colors.black,
    );
  }
}
