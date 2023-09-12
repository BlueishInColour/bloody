import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../../models/post_model.dart';
import '../../../models/user_model.dart';

import '../../../apis/deta_a.dart';
import '../full_screen_image.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'imagepod_menu_button.dart';

class UserPod extends StatefulWidget {
  const UserPod({super.key, this.gottenPosts = const [], this.index = 0});
  final List<Post> gottenPosts;
  final int index;
  @override
  State<UserPod> createState() => UserPodState();
}

class UserPodState extends State<UserPod> {
  User user = User(
    fullname: 'oluwapelumi',
    username: '@babablue',
  );
  getUser() async {
    var res = await userApi.get(widget.gottenPosts[widget.index].postedBy);
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
    return Container(
      height: 40,
      decoration: BoxDecoration(
        // color: palette.lightPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          //profilepix
          GestureDetector(
            onDoubleTap: () {
              Navigator.push(
                  context,
                  PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) {
                        return (FullScreenPage(
                            dark: true,
                            child: Image.network(user.profilePicture)));
                      }));
            },
            child: CircleAvatar(
                backgroundColor: palette.grey,
                backgroundImage:
                    CachedNetworkImageProvider(user.profilePicture)),
          ),

          const VerticalDivider(),
          //name and user name container
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //name
              Text(user.fullname,
                  style: TextStyle(fontSize: 15, color: palette.white)),
              Text(user.username, style: const TextStyle(color: Colors.blue))
            ],
          ),
          const VerticalDivider(),
          const Icon(
            Icons.star,
            size: 12,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: () => debugPrint('cat or sub cat clicked'),
                child: Text(post.category),
              ),
              GestureDetector(
                onTap: () => debugPrint('cat or sub cat clicked'),
                child: Text(post.subCategory),
              )
            ],
          ),

          const VerticalDivider(),
          const Expanded(child: SizedBox()),
          ImagepodMenuButton(
              gottenPosts: widget.gottenPosts, index: widget.index)
        ],
      )),
    );
  }
}
