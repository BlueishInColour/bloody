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
      this.gottenPosts = const [],
      this.index = 0,
      super.key});
  int index = 0;
  List<Post> gottenPosts = [];
  String singlePostKey = '';

  @override
  State<ImagePod> createState() => ImagePodState();
}

class ImagePodState extends State<ImagePod> with AutomaticKeepAliveClientMixin {
  bool imagegetterclicked = false;
  bool hasImage = false;
  File image = File('');

  bool manyFloatingwidget = false;

  bool extraDetails = false;

  @override
  bool get wantKeepAlive => true;
  @override
  Widget build(BuildContext context) {
    super.build(context);
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
                Text(widget.gottenPosts[index].postedBy,
                    style: const TextStyle(color: Colors.blue))
              ],
            ),

            const VerticalDivider()
          ],
        )),
      );
    }

    Widget creatorPod(context, int index) {
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
            const VerticalDivider(),
            Text(widget.gottenPosts[index].specialTag,
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
                                  child: Image.network(
                                      widget.gottenPosts[index].photosUrl[0]),
                                ));
                              }));
                    },
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: CachedNetworkImage(
                          imageUrl: widget.gottenPosts[index].photosUrl[0],
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
      ])));
    }

    Widget descriptionPod(contex, int index) {
      return SizedBox(
        child: extraDetails
            ? Text(widget.gottenPosts[index].text,
                style: TextStyle(
                  color: palette.white,
                  overflow: TextOverflow.ellipsis,
                ))
            : null,
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          userDetailsPod(context, widget.index),
          imagePod(context, widget.index),
          descriptionPod(context, widget.index),
          creatorPod(context, widget.index)
        ],
      ),
    );
  }
}
