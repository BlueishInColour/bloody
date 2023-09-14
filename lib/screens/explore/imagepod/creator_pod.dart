import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../models/post_model.dart';
import '../../../models/user_model.dart';

import '../../../apis/deta_a.dart';
import '../full_screen_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'imagepod_menu_button.dart';

class CreatorPod extends StatefulWidget {
  const CreatorPod({super.key, this.gottenPosts = const [], this.index = 0});
  final List<Post> gottenPosts;
  final int index;
  @override
  State<CreatorPod> createState() => CreatorPodState();
}

class CreatorPodState extends State<CreatorPod> {
  User user = User(
    fullname: 'oluwapelumi',
    username: '@babablue',
  );
  getUser() async {
    var res = await userApi.get(widget.gottenPosts[widget.index].specialTag);
    setState(
      () {
        user = User.fromJson(res['items']);
      },
    );
    print(res);
  }

  @override
  initState() {
    super.initState();
    getUser();
  }

  @override
  Widget build(BuildContext context) {
    int index = widget.index;
    List<Post> gottenPosts = widget.gottenPosts;
    Post post = gottenPosts[index];

    Widget tinyButton({IconData icondata = Icons.star, String text = ''}) {
      return GestureDetector(
        onTap: () => debugPrint('this button was clicked'),
        child: Row(children: [
          Text(text, style: TextStyle(color: palette.textColorLight)),
          Icon(icondata, size: 12),
        ]),
      );
    }

    return (Container(
      height: 40,
      decoration: BoxDecoration(
        color: Color.fromARGB(95, 255, 193, 7),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          CircleAvatar(
            backgroundColor: palette.grey,
            backgroundImage: CachedNetworkImageProvider(user.profilePicture),
          ),
          const VerticalDivider(),
          Expanded(
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '  ' 'pelumi',
                  style: TextStyle(
                      color: palette.textColorLight,
                      fontSize: 13,
                      overflow: TextOverflow.ellipsis),
                ),
                Text(widget.gottenPosts[index].specialTag,
                    style: const TextStyle(
                        color: Colors.blue, overflow: TextOverflow.ellipsis)),
              ],
            ),
          ),
          const VerticalDivider(),
          Column(children: [
            Text('designer',
                style: TextStyle(color: palette.textColorLight),
                overflow: TextOverflow.ellipsis),
            Text('bag maker',
                style: TextStyle(color: palette.textColorLight),
                overflow: TextOverflow.ellipsis),
          ]),
          const VerticalDivider(),
          Column(children: [
            tinyButton(icondata: Icons.star, text: '4'),
            tinyButton(icondata: Icons.speed, text: '3'),
          ]),
          const VerticalDivider(),
          IconButton(onPressed: () {}, icon: const Icon(Icons.expand_less)),
        ],
      ),
    ));
  }
}
