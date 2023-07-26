import 'package:bloody/Screens/camera_screen.dart';
import 'package:flutter/material.dart';

import '../Widgets/dummy_data.dart';
import '../main.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
//import 'dart:async';
import 'dart:io';
import '../Widgets/explore_screen_widgets/pod_icon_buttons.dart';
import '../Widgets/explore_screen_widgets/floatingactionbuttons.dart';
import '../Widgets/explore_screen_widgets/full_screen_image.dart';

import './camera_screen.dart';
import 'master.dart';

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
              text: 'freak',
              style: TextStyle(color: palette.black, fontSize: 42)),
          TextSpan(
              text: 'In', style: TextStyle(color: palette.red, fontSize: 42)),
          WidgetSpan(
              child: Icon(
            Icons.local_fire_department_rounded,
            color: palette.red,
            size: 35,
          )),
        ])),
      ),
      floatingActionButton: IconButton(
        icon: Icon(Icons.ac_unit_rounded, size: 50, color: Colors.blue),
        onPressed: () => Navigator.push(context,
            PageRouteBuilder(pageBuilder: (context, _, __) => Master())),
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
                            child: Image.network(posts[index].userprofilepix),
                            dark: true));
                      }));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: FadeInImage.assetNetwork(
                  placeholder: 'assets/images/placeholder.png',
                  placeholderFit: BoxFit.contain,
                  imageErrorBuilder: (context, error, stackTrace) =>
                      loadingImage(context, 300),
                  image: posts[index].userprofilepix,
                )),
          ),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: icon(re: () => null, icony: Icons.share_rounded)),
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

  Widget loadingImage(context, double height) {
    return (Container(
      height: height,
      color: palette.lightPurple,
    ));
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
                            child: Image.network(
                                "https://source.unsplash.com/random/?art&width=500&height=1000"),
                            dark: true));
                      }));
            },
            child: CircleAvatar(
                backgroundColor: palette.lightPurple,
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
          CircleAvatar(
            backgroundColor: palette.black,
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
        child: icon(
            re: () => debugPrint('clicked'),
            icony: Icons.local_fire_department_outlined),
      ),
      icon(
        re: () => null,
        size: 23,
        icony: Icons.chat_bubble_outline_rounded,
      ),
    ]));
  }
}
