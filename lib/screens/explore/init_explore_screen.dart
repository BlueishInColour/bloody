import '../../apis/upstash.dart';
import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import '../services/auth_services.dart';
///
import 'package:auth0_flutter/auth0_flutter.dart';
import 'package:auth0_flutter/auth0_flutter_web.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';
import 'package:loadmore_listview/loadmore_listview.dart';

///
import './imagepod.dart';
import '../../dummy_data.dart';
import '../../main.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
//import 'dart:async';
import 'dart:io';
import 'pod_icon_buttons.dart';
import 'post_upload_screen.dart';
import 'full_screen_image.dart';
import '../profile/edit_profile._screen.dart';
import '../../constant/configs.dart';

//to load data
import '../../apis/upstash.dart';
import '../../apis/imagekit.dart';
import '../../models/post_model.dart';

//final palette = Palette();

class ExploreScreenWidget extends StatefulWidget {
  final Auth0? auth0;
  const ExploreScreenWidget({this.auth0, final Key? key}) : super(key: key);

  @override
  State<ExploreScreenWidget> createState() => ExploreScreenWidgetState();
}

class ExploreScreenWidgetState extends State<ExploreScreenWidget> {
  ExploreScreenWidgetState();

  //Oauthpart of explore screen

  Credentials? _credentials;
//login service state
  UserProfile? _user;

  late Auth0 auth0;
  late Auth0Web auth0Web;

  @override
  void initState() {
    super.initState();
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
  List<String> allKeys = [];
  getAllKeys() async {
    print('started to fet keys');
    List<String> res = await upstash.postApi.keys('*');
    print(res);
    List<String> keys = [];
    List unduplicatedKeys = keys.toSet().toList();

    setState(() {});
    print(keys);
  }

  //get random keys and setting them to list
  List<String> randomKeys = [];
  getRandomKeys() async {
    print('started to get random keys');
    final String? res = await upstash.postApi.randomkey();
    print(res);

    setState(() {
      randomKeys.add(res!);
    });
    print(randomKeys);
  }

  @override
  Widget build(BuildContext context) {
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
                        color: palette.white,
                        fontSize: 35,
                        fontFamily: 'Geologica_Cursive-Bold')),
              ])),
            ),
            _credentials == null
                ? ElevatedButton(
                    onPressed: login, child: const Text("login | signin"))
                : CircleAvatar(
                    backgroundImage: CachedNetworkImageProvider(
                        _credentials!.user.pictureUrl.toString()),
                  )
          ],
        ),
      );
    }
    //full screen image page route

///////*********User details pod  ******/////

    void refreshToGetMoreDataFromDb() async {
      debugPrint('refresing');
    }

    return (Scaffold(
        appBar: appbar(context),
        floatingActionButton: CircleAvatar(
          radius: 30,
          backgroundColor: palette.white,
          child: IconButton(
              color: palette.black,
              padding: const EdgeInsets.all(0),
              onPressed: () => showModalBottomSheet(
                    context: context,
                    showDragHandle: true,
                    useSafeArea: true,
                    backgroundColor: palette.white,
                    // anchorPoint: Offset(500, 500),
                    isScrollControlled: true,
                    enableDrag: true,
                    isDismissible: true,
                    // barrierColor: palette.white,
                    shape: const ContinuousRectangleBorder(
                        // side: BorderSide(width: 5),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(70),
                            topRight: Radius.circular(70))),
                    //  isDismissible: bool.fromEnvironment('off'),
                    constraints: const BoxConstraints(maxHeight: 600),
                    builder: (BuildContext context) {
                      return const PostUpload();
                    },
                  ),
              icon: Icon(Icons.file_upload_outlined,
                  size: 40, color: palette.grey)),
        ),
        body: LoadMoreListView.builder(
          //is there more data to load
          // haveMoreItem: true,
          //Trigger the bottom loadMore callback
          onLoadMore: () async {
            //wait for your api to fetch more items
            await getRandomKeys();
          },
          //pull down refresh callback
          onRefresh: () async {
            //wait for your api to update the list
            await Future.delayed(const Duration(seconds: 1));
          },
          //you can set your loadMore Animation
          loadMoreWidget: Container(
              margin: const EdgeInsets.all(20.0),
              alignment: Alignment.center,
              child: CircleAvatar(
                  backgroundColor: palette.grey,
                  child: CircularProgressIndicator())),
          //ListView
          itemCount: posts.length,
          itemBuilder: (context, index) => ImagePod(index: index),
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          //   itemCount: posts.length
        )));
  }
}
