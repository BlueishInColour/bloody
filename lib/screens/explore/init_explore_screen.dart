import '../../apis/upstash.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import '../services/auth_services.dart';
///
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';

import 'dart:async';
import 'dart:convert';

///
import './imagepod/init_imagepod.dart';
import '../../main.dart';
import '../../constant/configs.dart';
import './profile_screen/init_profile_screen.dart';
import './post_upload_screen.dart';
import '../../apis/deta_a.dart';
import '../../models/post_model.dart';
import './floating_action_button.dart';
import './listview.dart';
import './login_signup_button.dart';
import './appbar.dart';
import '../tabs/init_tabs_screen.dart';

//final palette = Palette();
class Fetched {}

class ExploreScreen extends StatefulWidget {
  const ExploreScreen({super.key});
  @override
  State<ExploreScreen> createState() => ExploreScreenState();
}

class ExploreScreenState extends State<ExploreScreen>
    with AutomaticKeepAliveClientMixin {
  ExploreScreenState();
//loadmore
  List<String> originalItems = List<String>.generate(10000, (i) => "Item $i");
  List<Post> items = [];
  int perPage = 1;
  int present = 0;

  List<Post> gottenPosts = <Post>[];
  get20Posts() async {
    print('trying to get stuff out');
    Map<String, dynamic> res = await postApi.fetch(limit: 20);
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

  final ScrollController scrollController = ScrollController();
  @override
  void initState() {
    get20Posts();
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels ==
          scrollController.position.maxScrollExtent - 10) {
        get20Posts();
      }
    });

    //get posts
  }

//get list of post keys $$still working on thid
//th list is prnting duplicate and will always rerender which i s costly
//if i do it abiturary way so we are just testing for now

  //get random keys and setting them to list
  @override
  bool get wantKeepAlive => true;
  bool iconClicked = false;
  @override
  Widget build(BuildContext context) {
    super.build(context);

    //full screen image page route
    PreferredSizeWidget appBar(context) {
      return AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications),
            onPressed: () {
              Navigator.push(context,
                  PageRouteBuilder(pageBuilder: (context, _, __) {
                return const TabsScreen();
              }));
            },
          )
        ],
        backgroundColor: palette.black,
        toolbarHeight: iconClicked ? 450 : null,
        // toolbarHeight: 40,

        title: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        iconClicked = !iconClicked;
                      });
                    },
                    child: Text.rich(TextSpan(children: [
                      TextSpan(
                          text: '&',
                          style: TextStyle(
                              color: palette.amber,
                              fontSize: 35,
                              fontFamily: 'Geologica_Cursive-Bold')),
                    ])),
                  ),
                ),
                const LoginOrSignup()
              ],
            ),
            iconClicked ? const SelectInterest() : const SizedBox()
          ],
        ),
      );
    }

    return (Scaffold(
      appBar: appBar(context),
      floatingActionButton:
          iconClicked ? const SizedBox() : const ExploreFloatingActionButton(),
      body: NotificationListener<ScrollNotification>(
        onNotification: (ScrollNotification scrollInfo) {
          (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent - 10)
              ? get20Posts()
              : null;

          return true;
        },
        child: LoadOrPresent(
          isEmpty: gottenPosts.isEmpty,
          child: ExploreListView(
              gottenPosts: gottenPosts, scrollController: scrollController),
        ),
      ),
    ));
  }
}
