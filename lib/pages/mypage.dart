import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/pages/posts.dart';
import 'package:sample_sns/pages/picture.dart';
import 'package:sample_sns/pages/albums.dart';
import 'package:sample_sns/providers/post.dart';
import 'package:sample_sns/providers/picture.dart';
import 'package:sample_sns/providers/album.dart';
import 'package:sample_sns/providers/user.dart';
import 'package:sample_sns/common_parts.dart';
import 'package:sample_sns/repositories/user.dart';

class MyPage extends ConsumerWidget {
  const MyPage({Key? key}) : super(key: key);

  void init(WidgetRef ref) {
    // お気に入りリストを取得し、それぞれのプロバイダの favoriteList を設定
    ref.read(favoritePostsProvider).getFavoritePostList();
    ref.read(favoriteAlbumsProvider).getFavoriteAlbumList();
    ref.read(favoritePicturesProvider).getFavoritePictureList();
    Future(
      () async {
        // ユーザー名を取得し、設定
        final username = await getUserName();
        ref.read(usernameProvider.state).update(
              (state) => state = username,
            );
      },
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    init(ref);
    final postListProvider = ref.watch(favoritePostsProvider);
    final pictureListProvider = ref.watch(favoritePicturesProvider);
    final albumListProvider = ref.watch(favoriteAlbumsProvider);

    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              onPressed: () => Navigator.of(context).pushNamed('/settings'),
              icon: const Icon(Icons.settings),
            ),
          ],
          title: Consumer(
            builder: (context, ref, child) =>
                Text('${ref.watch(usernameProvider)}のお気に入り'),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                icon: Icon(
                  Icons.speaker_notes,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.collections,
                ),
              ),
              Tab(
                icon: Icon(
                  Icons.image,
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PostsWidget(
              postList: postListProvider.favoritePostList,
              isMypage: true,
            ),
            AlbumsWidget(
              albumList: albumListProvider.favoriteAlbumList,
              isMypage: true,
            ),
            PicturesWidget(
              pictureList: pictureListProvider.favoritePictureList,
              isMypage: true,
            ),
          ],
        ),
        bottomNavigationBar: const MyBottomNavigationBar(),
      ),
    );
  }
}
