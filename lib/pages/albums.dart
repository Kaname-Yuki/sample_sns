import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/models/album.dart';
import 'package:sample_sns/providers/album.dart';
import 'package:sample_sns/common_parts.dart';
import 'package:sample_sns/providers/user.dart';
import 'package:sample_sns/providers/common_parts.dart';

class AlbumsPage extends ConsumerWidget {
  const AlbumsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final albumList = ref.watch(albumListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('アルバム'),
        automaticallyImplyLeading: false,
      ),
      body: albumList.when(
        data: (data) => AlbumsWidget(albumList: data),
        error: (err, stack) => Text('Error: $err'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class AlbumsWidget extends StatelessWidget {
  final List<Album> albumList;
  final bool isMypage;
  const AlbumsWidget({
    super.key,
    required this.albumList,
    this.isMypage = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
      ),
      itemCount: albumList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final album = albumList[index];
        return AlbumWidget(
          id: album.id,
          album: album,
          isMypage: isMypage,
        );
      },
    );
  }
}

class AlbumWidget extends ConsumerWidget {
  final int id;
  final Album album;
  final bool isMypage;
  AlbumWidget({
    super.key,
    required this.id,
    required this.album,
    this.isMypage = false,
  });
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);
    void toPicturePage(int albumId, BuildContext context, WidgetRef ref) {
      ref.read(currentTabProvider.state).update((state) => 2);
      Navigator.of(context).pushNamed('/pictures');
    }

    ref.read(backImgProvider(album.id)).getBackImg();
    return GestureDetector(
      onTap: () => toPicturePage(id, context, ref),
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              ref.watch(backImgProvider(album.id)).imgUrl,
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: userList.when(
            data: (data) => [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          data[album.userId].name,
                        ),
                      ),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '@${data[album.userId].username}',
                        ),
                      ),
                    ],
                  ),
                  FavoriteWidget(
                    id: id,
                    type: 'album',
                    isMypage: isMypage,
                  ),
                ],
              ),
              Container(
                alignment: Alignment.centerLeft,
                child: Text(
                  album.title,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            error: (err, stack) => [
              Text('Error: $err'),
            ],
            loading: () => [
              const Text('loading user info...'),
            ],
          ),
        ),
      ),
    );
  }
}
