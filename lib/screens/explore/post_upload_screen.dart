import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../../main.dart';
import '../../models/post_model.dart';
import 'package:flutter_imagekit/flutter_imagekit.dart';
import 'dart:io';
import '../../constant/configs.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:uuid/uuid.dart';
//import '../../apis/upstash.dart';
import '../../apis/deta_a.dart';

class PostUpload extends StatefulWidget {
  const PostUpload({super.key});

  @override
  State<PostUpload> createState() => PostUploadState();
}

class PostUploadState extends State<PostUpload> {
  var textinfo = '';
  String flagged = '';
  Post post = Post(
      category: '',
      tags: '',
      postedBy: 'da vinco',
      // id: Uuid.NAMESPACE_DNS,
      photosUrl: [],
      text: '',
      specialTag: '');
  var hashtags = <String>[];

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
          post.photosUrl.insert(0, url);
        });
        debugPrint(url); // your Uploaded Image/Video Link From Imagekit
        print(post.toJson());
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
          post.photosUrl.insert(0, url);
        });
        debugPrint(url); // your Uploaded Image/Video Link From Imagekit
      }
    });
  }

  late FocusNode descriptionFocusNode;
  late FocusNode tagFocusNode;
  late FocusNode mentionFocusNode;
  @override
  initState() {
    super.initState();
    setState(() {
      post.id = Uuid.NAMESPACE_DNS;
    });
    descriptionFocusNode = FocusNode();
    tagFocusNode = FocusNode();
    mentionFocusNode = FocusNode();
  }

  @override
  void dispose() {
    descriptionFocusNode.dispose();
    tagFocusNode.dispose();
    mentionFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: mainBody(context),
      bottomSheet: bottomSheet(context),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
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
                  backgroundColor: MaterialStatePropertyAll(palette.white),
                  shape: const MaterialStatePropertyAll(StadiumBorder()),
                  foregroundColor: MaterialStatePropertyAll(palette.black)),
              onPressed: () async {
                var res = await postApi.put(post.toJson());
                print(res);
                SnackBar onPost = const SnackBar(
                  content: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('uploading post'),
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
                'post',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )));
  }

  String flag = '';
  Widget mainBody(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          dropDownMenu(context),
          post.photosUrl.isEmpty
              ? dummyMediaContentPartWidget(context)
              : mediaContentPartWidget(context),
          descriptionWidget(context),
          tagWidget(context),
          post.specialTag.isEmpty
              ? const SliverToBoxAdapter(child: SizedBox())
              : creatorPod(context, post.specialTag),
          flagPartWiget(context),
          const SliverToBoxAdapter(child: SizedBox(height: 60))
        ],
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<<<mainBody
  Widget dropDownMenu(BuildContext context) {
    return SliverToBoxAdapter(
      child: Center(
        child: DropdownMenu(
            onSelected: (value) {
              setState(() {
                post.category = value!;
              });
            },
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: palette.grey,
                focusColor: palette.grey,
                hoverColor: palette.grey,
                constraints:
                    const BoxConstraints(minWidth: 500, minHeight: 60)),
            width: 350,
            menuStyle: MenuStyle(
              minimumSize: const MaterialStatePropertyAll(Size(300, 60)),
              backgroundColor: MaterialStatePropertyAll(palette.grey),
              surfaceTintColor: MaterialStatePropertyAll(palette.grey),
            ),
            label: Text('type',
                style: TextStyle(fontSize: 12, color: palette.white)),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'general', label: 'general'),
              DropdownMenuEntry(value: 'cars', label: 'cars'),
              DropdownMenuEntry(value: 'sport', label: 'sport'),
              DropdownMenuEntry(value: 'shoes', label: 'shoes'),
              DropdownMenuEntry(value: 'boo', label: 'babe'),
              DropdownMenuEntry(value: 'wildlife', label: 'wildlife'),
              DropdownMenuEntry(value: 'work', label: 'work'),
              DropdownMenuEntry(value: 'lifestyle', label: 'lifestyle'),
              DropdownMenuEntry(value: 'children', label: 'children'),
              DropdownMenuEntry(value: 'streets', label: 'streets'),

              //   DropdownMenuEntry(value: 'none', label: 'none'),
            ]),
      ),
    );
  }

  Widget mediaContentPartWidget(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: 400,
      color: palette.black,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        addAutomaticKeepAlives: true,
        itemCount: post.photosUrl.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CachedNetworkImage(imageUrl: post.photosUrl[index])),
          );
        },
      ),
    ));
  }

  Widget dummyMediaContentPartWidget(BuildContext context) {
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

  Widget descriptionWidget(BuildContext context) {
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
                  post.text = value;
                });
              },
              decoration: InputDecoration(
                  hoverColor: palette.grey,
                  hintText:
                      'description helps fashionistas to find your styles easily',
                  hintStyle: TextStyle(color: palette.white)),
              minLines: 20,
              maxLines: 21,
            )),
      ),
    );
  }

  Widget tagWidget(BuildContext context) {
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
                  post.tags = value;
                });
              },
              decoration: InputDecoration(
                  hoverColor: palette.grey,
                  hintText:
                      '@mention people and #tag topic seperate with a comma',
                  hintStyle: TextStyle(color: palette.white)),
              minLines: 20,
              maxLines: 21,
            )),
      ),
    );
  }

  Widget creatorPod(context, String name) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: (Container(
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
                backgroundColor: palette.white,
                // backgroundImage: const NetworkImage(
                //   "https://source.unsplash.com/random/?art&width=500&height=1000",
                // ),
              ),
              const VerticalDivider(),
              Text(name,
                  style: const TextStyle(
                    color: Colors.blue,
                  )),
              const VerticalDivider(),
              const Expanded(child: SizedBox())
            ],
          ),
        )),
      ),
    );
  }

  Widget flagPartWiget(BuildContext context) {
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
            height: 60,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  flagged = value;
                });
              },
              decoration: InputDecoration(
                  // hintText: 'tag a @creator or #topic',
                  //    helperText: flag,
                  prefixText: flag,
                  prefixStyle: const TextStyle(fontSize: 20),
                  // labelText: 'flag',
                  hintStyle: TextStyle(color: palette.white),
                  hoverColor: palette.grey,
                  prefixIcon: const Icon(Icons.alternate_email_outlined),
                  suffixIcon: CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          post.specialTag = '@$flagged';
                        });
                        print('just flagged a post, ${post.specialTag}');
                      },
                      icon: const Icon(Icons.outlined_flag_sharp),
                    ),
                  )),
            )),
      ),
    );
  }

// mainBody >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

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
          IconButton(
            onPressed: () => mentionFocusNode.requestFocus(),
            icon: Icon(Icons.alternate_email_rounded,
                size: 35, color: palette.white),
          ),
        ],
      )),
    );
  }
}
