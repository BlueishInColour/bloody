import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import '../main.dart';
import '../apis/upstash.dart';
import '../models/post_model.dart';
//import '../Apis/create_post_freakon.dart';
import '../apis/imagekit.dart';
import 'package:flutter_imagekit/flutter_imagekit.dart';
import 'dart:io';
import '../constant/configs.dart';
import 'package:cached_network_image/cached_network_image.dart';

class PostUpload extends StatefulWidget {
  const PostUpload({super.key});

  @override
  State<PostUpload> createState() => PostUploadState();
}

class PostUploadState extends State<PostUpload> {
  var textinfo = '';
  String flagged = '';
  Post post = Post(
      postType: '',
      tags: '',
      id: 'fishyyy',
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
        backgroundColor: Colors.white12,
        foregroundColor: palette.black,
        leadingWidth: 70,
        leading: SizedBox(
          height: 25,
          child: TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(palette.black),
                  shape: const MaterialStatePropertyAll(StadiumBorder()),
                  foregroundColor: MaterialStatePropertyAll(palette.white)),
              onPressed: () => debugPrint('draft'),
              child: const Text('draft')),
        ),
        title: Row(
          children: [
            const Expanded(child: SizedBox()),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(palette.black),
                  shape: const MaterialStatePropertyAll(StadiumBorder()),
                  foregroundColor: MaterialStatePropertyAll(palette.white)),
              onPressed: () async {
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
                await postApi.json
                    .set('blueishincolour', r'$' '.${post.id}', post.toJson())
                    .then((value) {
                  print(value);
                });
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
          extrainfoPartWidget(context),
          flaggedContainer(context),
          post.tags.isEmpty
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
                post.postType = value!;
              });
            },
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: palette.grey,
                focusColor: palette.grey,
                hoverColor: palette.grey,
                constraints:
                    const BoxConstraints(minWidth: 500, minHeight: 60)),
            width: 300,
            menuStyle: MenuStyle(
              minimumSize: const MaterialStatePropertyAll(Size(300, 60)),
              backgroundColor: MaterialStatePropertyAll(palette.grey),
              surfaceTintColor: MaterialStatePropertyAll(palette.grey),
            ),
            label: Text('type',
                style: TextStyle(fontSize: 12, color: palette.black)),
            dropdownMenuEntries: const [
              DropdownMenuEntry(value: 'style', label: 'style'),
              DropdownMenuEntry(value: 'blog', label: 'blog'),
              DropdownMenuEntry(value: 'loundry', label: 'loundry'),
              DropdownMenuEntry(value: 'exhibition', label: 'exhibition'),

              //   DropdownMenuEntry(value: 'none', label: 'none'),
            ]),
      ),
    );
  }

  Widget mediaContentPartWidget(BuildContext context) {
    return SliverToBoxAdapter(
        child: Container(
      height: 400,
      color: palette.white,
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
                  // border: Border.all(color: palette.black)
                ),
                child: const Center(
                    child:
                        Text('click camera or file at bottom to add image')))));
  }

  Widget extrainfoPartWidget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: palette.grey,
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(color: palette.black)
            ),
            // padding: EdgeInsets.all(8),
            height: 300,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  post.text = value;
                });
              },
              decoration: InputDecoration(
                  hoverColor: palette.grey,
                  hintText: 'extra information',
                  hintStyle: TextStyle(color: palette.black)),
              minLines: 20,
              maxLines: 21,
            )),
      ),
    );
  }

  Widget flaggedContainer(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: palette.grey,
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(color: palette.black)
            ),
            // padding: EdgeInsets.all(8),
            height: 300,
            child: TextFormField(
              onChanged: (value) {
                setState(() {
                  post.tags = value;
                });
              },
              decoration: InputDecoration(
                  hoverColor: palette.grey,
                  hintText: 'extra information',
                  hintStyle: TextStyle(color: palette.black)),
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
                backgroundColor: palette.black,
                // backgroundImage: const NetworkImage(
                //   "https://source.unsplash.com/random/?art&width=500&height=1000",
                // ),
              ),
              pad(),
              Text(name,
                  style: const TextStyle(
                    color: Colors.blue,
                  )),
              pad(),
              const Expanded(child: SizedBox())
            ],
          ),
        )),
      ),
    );
  }

  Widget pad([Color color = const Color.fromARGB(255, 72, 72, 73)]) {
    return (VerticalDivider(color: color));
  }

  Widget flagPartWiget(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
            decoration: BoxDecoration(
              color: palette.grey,
              borderRadius: BorderRadius.circular(15),
              // border: Border.all(color: palette.black)
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
                  hintStyle: TextStyle(color: palette.black),
                  hoverColor: palette.grey,
                  prefixIcon: Icon(Icons.tag),
                  suffixIcon: CircleAvatar(
                    child: IconButton(
                      onPressed: () {
                        setState(() {
                          post.specialTag = flagged;
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

  Widget filePickScreen(BuildContext context) {
    return (const Text('pickfile'));
  }

  Widget textInputScreen(BuildContext context) {
    return (const Text('textInput'));
  }

  Widget tagInputScreen(BuildContext context) {
    return (const Text('TagInput'));
  }

  Widget bottomSheet(BuildContext context) {
    return SizedBox(
      height: 60,
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
                  size: 40, color: palette.black)),
          IconButton(
            onPressed: () {
              debugPrint('clicked');
              getFileImages();
            },
            icon: Icon(Icons.upload_file_outlined,
                size: 40, color: palette.black),
          ),
          IconButton(
              onPressed: () => debugPrint('clicked'),
              icon: Icon(Icons.drive_file_rename_outline,
                  size: 40, color: palette.black)),
          IconButton(
            onPressed: () => debugPrint('clicked'),
            icon: Icon(Icons.flag_outlined, size: 40, color: palette.black),
          ),
        ],
      )),
    );
  }
}
