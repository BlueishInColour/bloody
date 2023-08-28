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
import '../../models/post_model.dart';

class ImagePod extends StatefulWidget {
  ImagePod(
      {this.singlePostKey = '',
      List<String> listOfPost = const [],
      int index = 0,
      super.key});
  final index = 0;
  final listOfPost = [];
  String singlePostKey = '';

  @override
  State<ImagePod> createState() => ImagePodState();
}

class ImagePodState extends State<ImagePod> {
  bool imagegetterclicked = false;
  bool hasImage = false;
  File image = File('');

  bool manyFloatingwidget = false;

  bool extraDetails = false;

  Post? initialPost = Post(
      id: '',
      postedBy: '@rubic',
      text: '',
      photosUrl: [
        'https://ik.imagekit.io/bluerubic/flutter_imagekit/Logopit_1692812359977_YIjC9fthW.jpg'
      ],
      tags: '',
      specialTag: '@BlueishInColour');

  Future<Post> getPost() async {
    final res = await upstash.postApi.json
        .get<List<Map<String, dynamic>>>(widget.singlePostKey, [r'$']);
    print(res);
    Post herepost = Post.fromJson(res![0]);
    print('this is the post to json that should be displayed');
    print(herepost.toJson());

    return (herepost);
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return (FutureBuilder(
      future: getPost(),
      initialData: initialPost,
      builder: (ctx, snapshot) {
        Post? post = snapshot.data;

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

                const VerticalDivider(),
                //name and user name container
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    //name
                    Text(posts[index].name,
                        style: TextStyle(fontSize: 15, color: palette.white)),
                    Text(post!.postedBy,
                        style: const TextStyle(color: Colors.blue))
                  ],
                ),

                const VerticalDivider()
              ],
            )),
          );
        }

        Widget creatorPod(context) {
          Widget actionButtons() {
            return (Row(children: [
              Semantics(
                label: 'like',
                hint: 'like',
                enabled: true,
                child: Iconish(
                    re: () => debugPrint('clicked'),
                    icony: Icons.favorite_rounded),
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
                const VerticalDivider(),
                Text(post!.specialTag,
                    style: const TextStyle(
                      color: Colors.blue,
                    )),
                const VerticalDivider(),
                Expanded(child: actionButtons())
              ],
            ),
          ));
        }

        Widget imagePod(BuildContext context, int index) {
          return (Center(
              child: Column(children: [
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
                                      child: Image.network(post.photosUrl[0]),
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
                                child: const Center(
                                    child: Text('fetching images')),
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
          ])));
        }

        Widget descriptionPod(contex) {
          return SizedBox(
            child: extraDetails
                ? Text(post!.text,
                    style: TextStyle(
                      color: palette.white,
                      overflow: TextOverflow.ellipsis,
                    ))
                : null,
          );
        }

        if (snapshot.connectionState == ConnectionState.none) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                height: 250,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.amber,
                ),
                child: Center(
                  child: Text('come`n connect to the internet',
                      style: TextStyle(color: palette.errorTextColor)),
                )),
          );
        }

        // Checking if future is resolved
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber,
                  ),
                  child: Center(
                    child: Text('come`n connect to the internet',
                        style: TextStyle(color: palette.errorTextColor)),
                  )),
            );

            // if we got our data
          } else if (snapshot.hasData && post!.photosUrl.isNotEmpty) {
            // Extracting data from snapshot object

            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  userDetailsPod(context, widget.index),
                  imagePod(context, widget.index),
                  descriptionPod(context),
                  creatorPod(context)
                ],
              ),
            );
          } else {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  height: 250,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.amber,
                  ),
                  child: Center(
                    child: Text('something went wrong somewhere',
                        style: TextStyle(color: palette.errorTextColor)),
                  )),
            );
          }
        }

        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: 250,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.amber,
            ),
            child: const Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    ));
  }
}
