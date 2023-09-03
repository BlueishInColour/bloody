import 'package:flutter/material.dart';
import './imagepod.dart';
import '../../models/post_model.dart';

class ExploreListView extends StatelessWidget {
  ExploreListView({super.key, required this.gottenPosts});
  List<Post> gottenPosts = [];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: gottenPosts.length,
      itemBuilder: (context, index) {
        return ImagePod(index: index, gottenPosts: gottenPosts);
      },
    );
  }
}
