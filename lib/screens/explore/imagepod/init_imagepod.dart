import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
//import '../services/auth_services.dart';
///
///
import '../../../dummy_data.dart';
import '../../../main.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
//import 'dart:async';
import 'dart:io';
import '../full_screen_image.dart';

//to load data
import '../../../apis/upstash.dart';
import '../../../models/post_model.dart';
import 'imagepod_menu_button.dart';
import 'user_pod.dart';
import 'creator_pod.dart';
import 'like_button.dart';
import 'share_button.dart';
import 'comment_button.dart';

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

    Widget imagePod(BuildContext context, int index) {
      Post post = widget.gottenPosts[index];
      Widget actionButtons(context) {
        return (Row(children: [LikeButton(post: post), const CommentButton()]));
      }

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
          const Positioned(bottom: 10, right: 10, child: ShareButton()),
          Positioned(bottom: 10, left: 10, child: actionButtons(context))
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
          UserPod(gottenPosts: widget.gottenPosts, index: widget.index),
          imagePod(context, widget.index),
          descriptionPod(context, widget.index),
          CreatorPod(gottenPosts: widget.gottenPosts, index: widget.index)
        ],
      ),
    );
  }
}
