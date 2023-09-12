import 'package:flutter/material.dart';
import '../../main.dart';
import '../explore/imagepod/init_imagepod.dart';
import 'package:flutter/material.dart';
import '../../main.dart';
import 'floating_search_button.dart';
import '../../models/post_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import '../../apis/deta_a.dart';

class SavedScreen extends StatefulWidget {
  const SavedScreen({super.key});

  @override
  State<SavedScreen> createState() => SavedScreenState();
}

class SavedScreenState extends State<SavedScreen> {
  List<Post> gottenPosts = [];

  get20saved() async {
    print('trying to get stuff out');
    Map<String, dynamic> res = await userApi.fetch(limit: 20);
    print(res);
    List posts = (res['items']);
    print('this is posts');
    print(posts);
    posts.map((e) {
      setState(() {
        gottenPosts.add(Post.fromJson(e));
      });
    }).toList();

    print('gottenposts');
    print(gottenPosts.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get20saved();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const TabsFloatingButton(),
      body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent - 10)
                ? get20saved()
                : null;

            return true;
          },
          child: LoadOrPresent(
            isEmpty: gottenPosts.isEmpty,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return ImagePod(index: index, gottenPosts: gottenPosts);
              },
            ),
          )),
    );
  }
}
