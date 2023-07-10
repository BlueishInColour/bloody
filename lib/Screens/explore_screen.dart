import 'package:bloody/Screens/upload_type_select_screen.dart';
import 'package:flutter/material.dart';

import '../Widgets/dummy_data.dart';
import '../main.dart';
//import 'package:image_picker/image_picker.dart';
//import 'package:image_picker_platform_interface/image_picker_platform_interface.dart';
//import 'dart:async';
import 'dart:io';
import '../Widgets/explore_screen_widgets/pod_icon_buttons.dart';
import '../Widgets/explore_screen_widgets/floatingactionbuttons.dart';

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

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: AppBar(title: const Text('tsunami',style:TextStyle(fontSize:42,fontWeight: FontWeight.bold))),
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
              ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: FadeInImage.assetNetwork(
                    placeholder: 'assets/images/placeholder.png',
                    placeholderFit: BoxFit.contain,
                    imageErrorBuilder: (context, error, stackTrace) =>
                        loadingImage(context, 300),
                    image: posts[index].userprofilepix,
                  )),
        ),
        Positioned(
            bottom: 10,
            right: 10,
            child: icon(re: () => null, icony: Icons.share_rounded)),
      ]),
      const SizedBox(height: 5),
      workerdetailspod(context),
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
          CircleAvatar(
              backgroundColor: palette.lightPurple,
              backgroundImage: const NetworkImage(
                "https://source.unsplash.com/random/?art&width=500&height=1000",
              )),

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

  Widget workerdetailspod(context) {
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
        child:
            icon(re: () => debugPrint('clicked'), icony: Icons.favorite_sharp),
      ),
      icon(re: () => null, icony: Icons.arrow_back),
    ]));
  }
}
