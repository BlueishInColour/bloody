import 'package:flutter/material.dart';
import './imagepod/init_imagepod.dart';
import '../../models/post_model.dart';

class ExploreListView extends StatelessWidget {
  ExploreListView(
      {super.key, required this.scrollController, required this.gottenPosts});
  List<Post> gottenPosts = [];
  final ScrollController scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      controller: scrollController,
      itemCount: gottenPosts.length,
      itemBuilder: (context, index) {
        return gottenPosts[index].photosUrl.isNotEmpty
            ? ImagePod(index: index, gottenPosts: gottenPosts)
            : const SizedBox();
      },
    );
  }
}
