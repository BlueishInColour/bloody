import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/loundry_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:flutter_imagekit/flutter_imagekit.dart';
import '../../apis/upstash.dart';
import '../../constant/configs.dart';

class LoundryScreen extends StatefulWidget {
  const LoundryScreen({super.key});

  @override
  State<LoundryScreen> createState() => LoundryScreenState();
}

class LoundryScreenState extends State<LoundryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const LoundryFloatingButton(),
      body: Column(
        children: [
          Row(
            children: [],
          ),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, _) {
                  return OneLoundry();
                }),
          ),
        ],
      ),
    );
  }
}

class OneLoundry extends StatelessWidget {
  const OneLoundry({super.key});

  @override
  Widget build(BuildContext context) {
    //modes define the stage in where the clothes are
    /// blue is accepted
    /// white is in wash
    /// brown means on delivery
    /// green means finish
    /// red means terminated

    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: (SizedBox(
          height: 170,
          child: Column(
            children: [
              ///first Row
              Column(
                children: [
                  Row(
                    children: [
                      const Icon(Icons.done_all, color: Colors.blue),
                      Expanded(
                          child: Text(
                        'oluwapelumi',
                        //  maxLines: 1,
                        style: TextStyle(
                            fontSize: 11,
                            color: palette.white,
                            overflow: TextOverflow.ellipsis),
                      )),
                      Expanded(
                        child: Text('oawie4 2onoi4 2n3i3',
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 11,
                                color: palette.linkTextColor,
                                overflow: TextOverflow.ellipsis)),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Text(
                          'your request for service is accepted and courreir is on the way',
                          style: TextStyle(
                              color: palette.white,
                              fontSize: 11,
                              overflow: TextOverflow.ellipsis),
                        ),
                      ),
                    ],
                  )
                ],
                //2310941521 funmilayo oluwa uba
              ),
              const SizedBox(height: 4),
              SizedBox(
                height: 100,
                width: 500,
                child: CachedNetworkImage(
                  fit: BoxFit.fill,
                  imageUrl: 'https://source.unsplash.com/random/?loundry',
                  placeholder: (context, url) => Container(
                      height: 100,
                      width: 500,
                      color: palette.amber,
                      child: const CircleAvatar(
                        radius: 15,
                        child: CircularProgressIndicator(),
                      )),
                  errorWidget: (context, url, error) {
                    return Container(
                        height: 100,
                        width: 500,
                        color: palette.amber,
                        child: const Center(
                            child: Text('error occured getting image')));
                  },
                ),
              )
            ],
          ))),
    );
  }
}

class LoundryFloatingButton extends StatelessWidget {
  const LoundryFloatingButton({super.key});

  @override
  Widget build(BuildContext context) {
    return (CircleAvatar(
        radius: 30,
        backgroundColor: palette.black,
        child: Center(
          child: IconButton(
              onPressed: () {
                debugPrint('loundry clicked');
                showLoundrytUploadScreen(context);
              },
              icon: Icon(
                Icons.local_laundry_service_rounded,
                color: palette.amber,
                size: 30,
              )),
        )));
  }
}

class LoundryUploadScreen extends StatefulWidget {
  const LoundryUploadScreen({super.key});

  @override
  State<LoundryUploadScreen> createState() => LoundryUploadScreenState();
}

class LoundryUploadScreenState extends State<LoundryUploadScreen> {
  Loundry loundry = Loundry();
  late FocusNode descriptionFocusNode;
  @override
  initState() {
    super.initState();

    descriptionFocusNode = FocusNode();
  }

  getFileImages() async {
    print('connected');
    var image = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    );

    await ImageKit.io(
      File(image!.path),
      privateKey: imagekitPrivateApiKey, // (Keep Confidential)
      onUploadProgress: (progressValue) {
        {
          debugPrint(progressValue.toString());
        }
      },
    ).then((String url) {
      {
        setState(() {
          loundry.photosUrl = url;
        });
        debugPrint(url); // your Uploaded Image/Video Link From Imagekit
        print(loundry.toJson());
      }
    });
  }

  getCameraImages() async {
    print('connected');
    var image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);

    await ImageKit.io(
      File(image!.path),
      privateKey: imagekitPrivateApiKey, // (Keep Confidential)
      onUploadProgress: (progressValue) {
        {
          debugPrint(progressValue.toString());
        }
      },
    ).then((String url) {
      {
        setState(() {
          loundry.photosUrl = url;
        });
        debugPrint(url); // your Uploaded Image/Video Link From Imagekit
      }
    });
  }

  Widget loundryPictureWidget(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: 400,
      color: palette.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        addAutomaticKeepAlives: true,
        itemCount: 1,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(imageUrl: loundry.photosUrl)),
          );
        },
      ),
    ));
  }

  Widget dummyloundryWidget(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
                height: 200,
                decoration: BoxDecoration(
                  color: palette.grey,
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(color: palette.white)
                ),
                child: const Center(
                    child:
                        Text('click camera or file at bottom to add image')))));
  }

  Widget loundryTextWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: palette.grey,
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(color: palette.white)
            ),
            // padding: EdgeInsets.all(8),
            height: 70,
            child: TextFormField(
              focusNode: descriptionFocusNode,
              onChanged: (value) {
                setState(() {
                  loundry.kg = value;
                });
              },
              decoration: InputDecoration(
                  hoverColor: palette.grey,
                  hintText: 'how many kg is the cloth to be drycleaned',
                  hintStyle: TextStyle(color: palette.black)),
              minLines: 20,
              maxLines: 21,
            )),
      ),
    );
  }

  Widget bottomSheet(BuildContext context) {
    return SizedBox(
      height: 45,
      child: (Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () {
                debugPrint('camera clicked');
                getCameraImages();
              },
              icon: Icon(Icons.camera_alt_outlined,
                  size: 35, color: palette.white)),
          IconButton(
            onPressed: () {
              debugPrint('clicked');
              getFileImages();
            },
            icon: Icon(Icons.upload_file_outlined,
                size: 35, color: palette.white),
          ),
          IconButton(
              onPressed: () => descriptionFocusNode.requestFocus(),
              icon: Icon(Icons.drive_file_rename_outline,
                  size: 35, color: palette.white)),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      body: CustomScrollView(
        slivers: [
          loundry.photosUrl.isEmpty
              ? dummyloundryWidget(context)
              : loundryPictureWidget(context),
          loundryTextWidget(context),
        ],
      ),
      bottomSheet: bottomSheet(context),
    ));
  }
}

showLoundrytUploadScreen(context) {
  return showModalBottomSheet(
      context: context,
      showDragHandle: true,
      useSafeArea: true,
      backgroundColor: palette.amber,
      // anchorPoint: Offset(500, 500),
      isScrollControlled: true,
      enableDrag: true,
      isDismissible: true,
      // barrierColor: palette.white,
      shape: const ContinuousRectangleBorder(
          // side: BorderSide(width: 5),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(70), topRight: Radius.circular(70))),
      //  isDismissible: bool.fromEnvironment('off'),
      constraints: const BoxConstraints(maxHeight: 600),
      builder: (BuildContext context) {
        return const LoundryUploadScreen();
      });
}
