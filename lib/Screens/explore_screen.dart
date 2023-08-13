import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import '../Widgets/dummy_data.dart';
import '../main.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
//import 'dart:async';
import 'dart:io';
import '../Widgets/explore_screen_widgets/pod_icon_buttons.dart';
import './post_upload_screen.dart';
import '../Widgets/explore_screen_widgets/full_screen_image.dart';

//final palette = Palette();

class ExploreScreenWidget extends StatefulWidget {
  const ExploreScreenWidget({super.key});

  @override
  State<ExploreScreenWidget> createState() => ExploreScreenWidgetState();
}

class ExploreScreenWidgetState extends State<ExploreScreenWidget> {
  ExploreScreenWidgetState();
  bool imagegetterclicked = false;
  bool hasImage = false;
  File image = File('');

  bool manyFloatingwidget = false;

  bool extraDetails = false;

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(
        title: Text.rich(TextSpan(children: [
          TextSpan(
              text: 'DIO',
              style: TextStyle(color: palette.black, fontSize: 35)),
          TextSpan(
              text: 'n',
              style: TextStyle(
                  color: palette.black,
                  fontSize: 47,
                  fontWeight: FontWeight.w500)),
          //  WidgetSpan(
          //      child: Icon(
          //    Icons.local_fire_department_outlined,
          //    color: palette.red,
          //    size: 35,
          //  )),
        ])),
      ),
      floatingActionButton: CircleAvatar(
        radius: 30,
        backgroundColor: palette.black,
        child: IconButton(
            color: palette.white,
            padding: const EdgeInsets.all(0),
            onPressed: () => showModalBottomSheet(
                  context: context,
                  showDragHandle: true,
                  useSafeArea: true,
                  backgroundColor: Colors.white70,
                  // anchorPoint: Offset(500, 500),
                  isScrollControlled: true,
                  enableDrag: true,
                  isDismissible: true,
                  // barrierColor: Colors.white,
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
      body: ListView.builder(
        itemBuilder: imagePod,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
        itemCount: posts.length,
      ),
    ));
  }

  var myfile = File('file.txt');

///// ****ImagePod Widget ********//////
/////
  ///
  ///
  ///
/////
  ///
  ///
  ///
  ///
  ///
  ///
  ///

  List<String> styleID = [''];
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
                        imageUrl: posts[index].postedpix,
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
        child: extraDetails
            ? const Text(
                'creates a text widget., If the [style] argument is null, the text will use the style from the closest enclosing [DefaultTextStyle].,The [data] parameter must not be null, The [overflow] property behavior is affected by the [softWrap] argument. If the [softWrap] is true or null, the glyph causing overflow, and those that follow, will not be rendered. Otherwise, it will be shown with the given overflow option.',
              )
            : null,
      ),
      const SizedBox(height: 5),
      creatorPod(context),
      const SizedBox(height: 30),
      const Divider()
    ])));
  }

  //full screen image page route

///////*********User details pod  ******/////
  ///
//////
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///
  ///

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

          pad(),
          //name and user name container
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //name
              Text(posts[index].name, style: const TextStyle(fontSize: 15)),
              Text(posts[index].username,
                  style: const TextStyle(color: Colors.blue))
            ],
          ),

          pad()
        ],
      )),
    );
  }

  Widget creatorPod(context) {
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
          const CircleAvatar(
            backgroundColor: Colors.blue,
            // backgroundImage: const NetworkImage(
            //   "https://source.unsplash.com/random/?art&width=500&height=1000",
            // ),
          ),
          pad(),
          const Text('@LouisVuitton',
              style: TextStyle(
                color: Colors.blue,
              )),
          pad(),
          Expanded(child: actionButtons())
        ],
      ),
    ));
  }

  Widget pad([Color color = const Color.fromARGB(255, 72, 72, 73)]) {
    return (VerticalDivider(color: color));
  }

  Widget actionButtons() {
    return (Row(children: [
      Semantics(
        label: 'like',
        hint: 'like',
        enabled: true,
        child: Iconish(
            re: () => debugPrint('clicked'),
            icony: Icons.local_fire_department_outlined),
      ),
      Iconish(
        re: () => null,
        size: 23,
        icony: Icons.chat_bubble_outline_rounded,
      ),
    ]));
  }
}
