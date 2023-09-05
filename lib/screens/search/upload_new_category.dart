import 'package:flutter/material.dart';
import '../../main.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../models/category_model.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:flutter_imagekit/flutter_imagekit.dart';
import '../../apis/upstash.dart';
import '../../constant/configs.dart';
import '../../apis/deta_a.dart';

class NewCategoryUploadScreen extends StatefulWidget {
  const NewCategoryUploadScreen({super.key});

  @override
  State<NewCategoryUploadScreen> createState() =>
      NewCategoryUploadScreenState();
}

class NewCategoryUploadScreenState extends State<NewCategoryUploadScreen> {
  late FocusNode descriptionFocusNode;
  late FocusNode tagFocusNode;
  @override
  initState() {
    super.initState();

    descriptionFocusNode = FocusNode();
    tagFocusNode = FocusNode();
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
          NewCategory.categoryPhotoUrl = url;
        });
        debugPrint(url); // your Uploaded Image/Video Link From Imagekit
        print(NewCategory.toJson());
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
          NewCategory.categoryPhotoUrl = url;
        });
        debugPrint(url); // your Uploaded Image/Video Link From Imagekit
      }
    });
  }

  Category NewCategory = Category();
  PreferredSizeWidget NewCategoryAppBar(BuildContext context) {
    //String uuid = Uuid.NAMESPACE_DNS;
    return (AppBar(
        backgroundColor: palette.black,
        foregroundColor: palette.white,
        leadingWidth: 70,
        leading: SizedBox(
          height: 25,
          child: ElevatedButton(
              style: const ButtonStyle(
                shape: MaterialStatePropertyAll(StadiumBorder()),
              ),
              onPressed: () => debugPrint('draft'),
              child: const Text('draft')),
        ),
        title: Row(
          children: [
            const Expanded(child: SizedBox()),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(palette.amber),
                  shape: const MaterialStatePropertyAll(StadiumBorder()),
                  foregroundColor: MaterialStatePropertyAll(palette.black)),
              onPressed: () async {
                await categoryApi.put(NewCategory.toJson());
                SnackBar onPost = const SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('nudging a NewCategory'),
                      CircularProgressIndicator(
                          color: Color.fromARGB(221, 209, 207, 207))
                    ],
                  ),
                  backgroundColor: Colors.black87,
                );

                Navigator.pop(context);
                ScaffoldMessenger.of(context).showSnackBar(onPost);

                debugPrint('clicked');

                debugPrint('done');
              },
              child: const Text(
                'add category',
                style: TextStyle(fontSize: 14),
              ),
            )
          ],
        )));
  }

  Widget NewCategoryPictureWidget(BuildContext context) {
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
                child:
                    CachedNetworkImage(imageUrl: NewCategory.categoryPhotoUrl)),
          );
        },
      ),
    ));
  }

  Widget dummyNewCategoryWidget(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: const EdgeInsets.all(8),
            child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: palette.grey,
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(color: palette.white)
                ),
                child: const Center(
                    child:
                        Text('click camera or file at bottom to add image')))));
  }

  Widget NewCategoryTextWidget(BuildContext context) {
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
            height: 150,
            child: TextFormField(
              focusNode: descriptionFocusNode,
              onChanged: (value) {
                setState(() {
                  NewCategory.categoryName = value;
                });
              },
              decoration: InputDecoration(
                  hoverColor: palette.grey,
                  hintText: 'talk about fashion of interest',
                  hintStyle: TextStyle(color: palette.black)),
              minLines: 20,
              maxLines: 21,
            )),
      ),
    );
  }

  Widget NewCategoryTagWidget(BuildContext context) {
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
            height: 120,
            child: TextFormField(
              focusNode: tagFocusNode,
              onChanged: (value) {
                setState(() {
                  NewCategory.subCategories = value;
                });
              },
              decoration: InputDecoration(
                  hoverColor: palette.grey,
                  hintText:
                      ' #hashtag topic seperate with a comma, helps fashionistas to easily find your post',
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
          IconButton(
            onPressed: () => tagFocusNode.requestFocus(),
            icon: Icon(Icons.tag, size: 35, color: palette.white),
          ),
        ],
      )),
    );
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
      appBar: NewCategoryAppBar(context),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            NewCategory.categoryPhotoUrl.isEmpty
                ? dummyNewCategoryWidget(context)
                : NewCategoryPictureWidget(context),
            NewCategoryTextWidget(context),
            NewCategoryTagWidget(context)
          ],
        ),
      ),
      bottomSheet: bottomSheet(context),
    ));
  }
}

showNewCategoryUploadScreen(context) {
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
        return const NewCategoryUploadScreen();
      });
}
