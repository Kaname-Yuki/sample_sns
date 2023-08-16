import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sample_sns/models/post.dart';
import 'package:sample_sns/providers/post.dart';
import 'package:sample_sns/providers/user.dart';
import 'package:sample_sns/common_parts.dart';

class PostsPage extends ConsumerWidget {
  const PostsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final postList = ref.watch(postListProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('投稿'),
        automaticallyImplyLeading: false,
      ),
      body: postList.when(
        data: (data) => PostsWidget(postList: data),
        error: (err, stack) => Text('Error: $err'),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}

class PostsWidget extends StatelessWidget {
  final List<Post> postList;
  final bool isMypage;
  const PostsWidget({
    super.key,
    required this.postList,
    this.isMypage = false,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: postList.length,
      itemBuilder: (context, index) {
        final post = postList[index];
        return PostWidget(
          id: post.id,
          post: post,
          isMypage: isMypage,
        );
      },
    );
  }
}

class PostWidget extends ConsumerWidget {
  final int id;
  final Post post;
  final bool isMypage;
  const PostWidget({
    super.key,
    required this.id,
    required this.post,
    this.isMypage = false,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userList = ref.watch(userListProvider);
    return Card(
      child: Column(
        children: [
          Row(
            children: userList.when(
              data: (data) => [
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    left: 10,
                    right: 10,
                  ),
                  child: Text(data[post.userId].name),
                ),
                Container(
                  margin: const EdgeInsets.only(
                    top: 10,
                    bottom: 10,
                    right: 10,
                  ),
                  child: Text('@${data[post.userId].username}'),
                ),
              ],
              loading: () => [
                const Text('loading user info...'),
              ],
              error: (err, stack) => [
                Text('error: $err'),
              ],
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              post.title,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(
              bottom: 10,
              left: 10,
              right: 10,
            ),
            alignment: Alignment.centerLeft,
            child: Text(
              post.body,
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: FavoriteWidget(
              id: id,
              type: 'post',
              isMypage: isMypage,
            ),
          ),
        ],
      ),
    );
  }
}
