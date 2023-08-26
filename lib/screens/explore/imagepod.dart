import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import '../services/auth_services.dart';
///
///
import '../../dummy_data.dart';
import '../../main.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
//import 'dart:async';
import 'dart:io';
import 'pod_icon_buttons.dart';
import 'full_screen_image.dart';

//to load data
import '../../apis/upstash.dart';
import '../../apis/imagekit.dart';
import '../../models/post_model.dart';
import 'dart:convert';

class ImagePod extends StatefulWidget {
  ImagePod({List<String> listOfPost = const [], int index = 0, super.key});
  final index = 0;
  final listOfPost = [];

  @override
  State<ImagePod> createState() => ImagePodState();
}

class ImagePodState extends State<ImagePod> {
  bool imagegetterclicked = false;
  bool hasImage = false;
  File image = File('');

  bool manyFloatingwidget = false;

  bool extraDetails = false;

  Post? post = Post(
      id: '',
      postedBy: '@bluishcode',
      text: '',
      photosUrl: [],
      tags: '',
      specialTag: '');

  getPost() async {
    final res = await upstash.postApi.json.get<List<Map<String, dynamic>>>(
        '6ba7b810-9dad-11d1-80b4-00c04fd430c8', [r'$']);
    print(res);
    Post herepost = Post.fromJson(res![0]);

    return (herepost);
  }

  Widget userDetailsPod(BuildContext context, int index) {
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
                          child: Image.network(
                              "https://source.unsplash.com/random/?art&width=500&height=1000"),
                        ));
                      }));
            },
            child: CircleAvatar(
                backgroundColor: palette.grey,
                backgroundImage: const NetworkImage(
                  "https://source.unsplash.com/random/?art&width=500&height=1000",
                )),
          ),

          VerticalDivider(),
          //name and user name container
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //name
              Text(posts[index].name,
                  style: TextStyle(fontSize: 15, color: palette.white)),
              Text(post!.postedBy, style: const TextStyle(color: Colors.blue))
            ],
          ),

          VerticalDivider()
        ],
      )),
    );
  }

  Widget imagePod(BuildContext context, int index) {
    return (Center(
        child: Column(children: [
      userDetailsPod(context, index),
      const SizedBox(
        height: 5,
      ),
      Stack(children: [
        Container(
          decoration: BoxDecoration(
              color: palette.lightPurple,
              borderRadius: const BorderRadius.all(Radius.circular(20))),
          child:
              //   height: 400,
              // width: 250,
              // fit: BoxFit.fill,
              //posts[index].postedpix,
              GestureDetector(
                  onTap: () => setState(() {
                        extraDetails = !extraDetails;
                      }),
                  onDoubleTap: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) {
                              return (FullScreenPage(
                                dark: true,
                                child:
                                    Image.network(posts[index].userprofilepix),
                              ));
                            }));
                  },
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: CachedNetworkImage(
                        imageUrl: post!.photosUrl[0],
                        placeholder: (context, url) => Container(
                          height: 300,
                          color: palette.grey,
                          child: const Center(child: Text('fetching images')),
                        ),
                        errorWidget: (context, url, error) => Container(
                          height: 300,
                          color: palette.grey,
                          child: Center(
                              child: Text(
                            'connect to the internet',
                            style: TextStyle(color: palette.red),
                          )),
                        ),
                      ))),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: Iconish(re: () => null, icony: Icons.share_rounded)),
      ]),
      const SizedBox(height: 5),
      SizedBox(
        child: extraDetails ? Text(post!.text) : null,
      ),
      const SizedBox(height: 5),
      creatorPod(context),
      const SizedBox(height: 30),
      const Divider()
    ])));
  }

  Widget creatorPod(context) {
    Widget actionButtons() {
      return (Row(children: [
        Semantics(
          label: 'like',
          hint: 'like',
          enabled: true,
          child: Iconish(
              re: () => debugPrint('clicked'), icony: Icons.favorite_rounded),
        ),
        Iconish(
          re: () => null,
          size: 23,
          icony: Icons.chat_bubble,
        ),
      ]));
    }

    return (Container(
      height: 40,
      decoration: BoxDecoration(
        color: palette.lightPurple,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        textDirection: TextDirection.rtl,
        children: [
          CircleAvatar(
            backgroundColor: palette.grey,
            // backgroundImage: const NetworkImage(
            //   "https://source.unsplash.com/random/?art&width=500&height=1000",
            // ),
          ),
          VerticalDivider(),
          Text(post!.specialTag,
              style: TextStyle(
                color: Colors.blue,
              )),
          VerticalDivider(),
          Expanded(child: actionButtons())
        ],
      ),
    ));
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return (FutureBuilder(
        future: getPost(),
        initialData: post,
        builder: (ctx, snapshot) {
          final initialPost = snapshot.data;
          setState(() {
            post = initialPost;
          });
          if (post!.photosUrl.isNotEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                userDetailsPod(context, widget.index),
                imagePod(context, widget.index),
                creatorPod(context)
              ],
            );
          }
          return Container(color: palette.grey, height: 300);
        }));
  }
}
