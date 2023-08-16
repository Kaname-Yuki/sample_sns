import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/models/picture.dart';
import 'package:sample_sns/providers/picture.dart';
import 'package:sample_sns/common_parts.dart';

class PicturesPage extends ConsumerWidget {
  const PicturesPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    dynamic albumId = ModalRoute.of(context)!.settings.arguments;
    final pictureList = ref.watch(pictureListProvider(albumId));
    return Scaffold(
      appBar: AppBar(
        title: const Text('写真'),
        automaticallyImplyLeading: false,
      ),
      body: pictureList.when(
        data: (data) => PicturesWidget(pictureList: data),
        error: (err, stack) => Text('Error: $err'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class PicturesWidget extends ConsumerWidget {
  final List<Picture> pictureList;
  final bool isMypage;
  const PicturesWidget({
    super.key,
    required this.pictureList,
    this.isMypage = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
        ),
        itemCount: pictureList.length,
        itemBuilder: (context, index) {
          final picture = pictureList[index];
          return Stack(
            children: [
              Container(
                child: Image.network(picture.thumbnailUrl),
              ),
              Container(
                alignment: Alignment.bottomRight,
                child: FavoriteWidget(
                  type: 'picture',
                  id: picture.id,
                  isMypage: isMypage,
                ),
              ),
            ],
          );
        });
  }
}
