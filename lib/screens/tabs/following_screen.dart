import 'package:flutter/material.dart';
import '../../main.dart';
import 'floating_search_button.dart';
import '../../models/user_model.dart';

import 'package:cached_network_image/cached_network_image.dart';
import '../../apis/deta_a.dart';

class FollowingScreen extends StatefulWidget {
  const FollowingScreen({super.key});

  @override
  State<FollowingScreen> createState() => FollowingScreenState();
}

class FollowingScreenState extends State<FollowingScreen> {
  List<User> gottenUser = [];

  get20following() async {
    print('trying to get stuff out');
    Map<String, dynamic> res = await userApi.fetch(limit: 20);
    print(res);
    List posts = (res['items']);
    print('this is posts');
    print(posts);
    posts.map((e) {
      setState(() {
        gottenUser.add(User.fromJson(e));
      });
    }).toList();

    print('gottenposts');
    print(gottenUser.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    get20following();
  }

  Widget oneFollower(context,
      {required String name,
      required String username,
      required String pictureUrl}) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: SizedBox(
          height: 60,
          child: Row(children: [
            CircleAvatar(
              backgroundColor: palette.amber,
              radius: 30,
              child: CachedNetworkImage(imageUrl: pictureUrl),
            ),
            const SizedBox(width: 10),
            Text(username, style: TextStyle(color: palette.linkTextColor)),
            const SizedBox(width: 10),
            Text(name, style: TextStyle(color: palette.linkTextColor)),
            const Expanded(child: SizedBox())
          ]),
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const TabsFloatingButton(),
      body: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification scrollInfo) {
            (scrollInfo.metrics.pixels ==
                    scrollInfo.metrics.maxScrollExtent - 10)
                ? get20following()
                : null;

            return true;
          },
          child: LoadOrPresent(
            isEmpty: gottenUser.isEmpty,
            child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return oneFollower(context,
                    name: gottenUser[index].fullname,
                    username: gottenUser[index].username,
                    pictureUrl: gottenUser[index].profilePicture);
              },
            ),
          )),
    );
  }
}
