import '../../apis/upstash.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import '../services/auth_services.dart';
///
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';
import 'package:loadmore_listview/loadmore_listview.dart';

import 'dart:async';
import 'dart:convert';

///
import './imagepod.dart';
import '../../main.dart';
import '../../constant/configs.dart';
import './profile_screen/init_profile_screen.dart';
import './post_upload_screen.dart';
import '../../apis/deta_a.dart';
import '../../models/post_model.dart';
import './floating_action_button.dart';
import './listview.dart';

//final palette = Palette();
class Fetched {}

class ExploreScreenWidget extends StatefulWidget {
  final Auth0? auth0;
  const ExploreScreenWidget({this.auth0, final Key? key}) : super(key: key);

  @override
  State<ExploreScreenWidget> createState() => ExploreScreenWidgetState();
}

class ExploreScreenWidgetState extends State<ExploreScreenWidget>
    with AutomaticKeepAliveClientMixin {
  ExploreScreenWidgetState();
//loadmore
  List<String> originalItems = List<String>.generate(10000, (i) => "Item $i");
  List<Post> items = [];
  int perPage = 1;
  int present = 0;

  //Oauthpart of explore screen

  Credentials? _credentials;
//login service state
  UserProfile? _user;

  late Auth0 auth0;
  late Auth0Web auth0Web;

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

  @override
  void initState() {
    super.initState();

    //get posts
    get20Posts();

    //authentication
    auth0 = widget.auth0 ?? Auth0(AUTH0_DOMAIN, AUTH0_CLIENT_ID);
    auth0Web = Auth0Web(AUTH0_DOMAIN, AUTH0_CLIENT_ID);

    if (kIsWeb) {
      auth0Web.onLoad().then((final credentials) => setState(() {
            _user = credentials?.user;
          }));
    }
  }

  Future<void> login() async {
    try {
      if (kIsWeb) {
        return auth0Web.loginWithRedirect(redirectUrl: 'http://localhost:3000');
      }

      var credentials =
          await auth0.webAuthentication(scheme: AUTH0_CUSTOM_SCHEME).login();

      setState(() {
        _user = credentials.user;
      });
    } catch (e) {
      print(e);
    }
  }

  Future<void> logout() async {
    try {
      if (kIsWeb) {
        await auth0Web.logout(returnToUrl: 'http://localhost:3000');
      } else {
        await auth0.webAuthentication(scheme: AUTH0_CUSTOM_SCHEME).logout();
        setState(() {
          _user = null;
        });
      }
    } catch (e) {
      print(e);
    }
  }

//ending Oauth

//get list of post keys $$still working on thid
//th list is prnting duplicate and will always rerender which i s costly
//if i do it abiturary way so we are just testing for now

  //get random keys and setting them to list
  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
    //appbar

    PreferredSizeWidget appbar(context) {
      return AppBar(
        // toolbarHeight: 40,

        title: Row(
          children: [
            Expanded(
              child: Text.rich(TextSpan(children: [
                TextSpan(
                    text: '&',
                    style: TextStyle(
                        color: palette.amber,
                        fontSize: 35,
                        fontFamily: 'Geologica_Cursive-Bold')),
              ])),
            ),
            _user == null
                ? ElevatedButton(
                    onPressed: login, child: const Text("login | signin"))
                : GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                            pageBuilder: (context, _, __) =>
                                ProfileScreen(user: _user, mine: true))),
                    child: CircleAvatar(
                      backgroundImage: CachedNetworkImageProvider(
                          _user!.pictureUrl.toString()),
                    ),
                  )
          ],
        ),
      );
    }
    //full screen image page route

///////*********User details pod  ******/////

    return (Scaffold(
        appBar: appbar(context),
        floatingActionButton: const ExploreFloatingActionButton(),
        body: NotificationListener<ScrollNotification>(
            onNotification: (ScrollNotification scrollInfo) {
              (scrollInfo.metrics.pixels ==
                      scrollInfo.metrics.maxScrollExtent - 10)
                  ? get20Posts()
                  : null;

              return true;
            },
            child: LoadOrPresent(
              isEmpty: gottenPosts.isEmpty,
              child: ExploreListView(
                gottenPosts: gottenPosts,
              ),
            ))));
  }
}
