import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../main.dart';
import '../Apis/create_post_freakon.dart';
import '../Models/post_model.dart';

class PostUpload extends StatefulWidget {
  PostUpload({super.key});

  @override
  State<PostUpload> createState() => PostUploadState();
}

class PostUploadState extends State<PostUpload> {
  int selectedPageIndex = 0;

  final images = <File>[];
  var textinfo = '';
  String flagged = '';
  Post post = Post(
      data: Data(
        byte: [],
        extra_info: '',
        freakins: 0,
        freakouts: 0,
        posted_as_at: DateTime.now(),
        postedby: '',
        flag: [],
        pinnedTag: '',
      ),
      id: '',
      objectType: '');
  var hashtags = <String>[];
  getFileImages() async {
    print('connected');
    var image = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    );

    List<int> bytes = await image!.readAsBytes();
    print(bytes);
    print('done converting');
    setState(() {
      post.data.byte.insert(0, bytes);
    });
    print('done setting bytes');
  }

  getCameraImages() async {
    print('connected');
    var image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    List<int> bytes = await image!.readAsBytes();
    setState(() {
      post.data.byte.add(bytes);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: MainBody(context),
      bottomSheet: bottomSheet(context),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return (AppBar(
        backgroundColor: Colors.white12,
        foregroundColor: Colors.red,
        leadingWidth: 40,
        leading: IconButton(
          icon: Icon(Icons.local_fire_department_outlined,
              color: palette.red, size: 38),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Expanded(child: SizedBox()),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(palette.red),
                  shape: MaterialStatePropertyAll(StadiumBorder()),
                  foregroundColor: MaterialStatePropertyAll(palette.white)),
              onPressed: () {
                debugPrint('clicked');
                createPost(post);
              },
              child: Text(
                'post',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )));
  }

  String flag = '';
  Widget MainBody(BuildContext context) {
    return SafeArea(
      child: CustomScrollView(
        slivers: [
          dropDownMenu(context),
          post.data.byte.isEmpty
              ? dummyMediaContentPartWidget(context)
              : mediaContentPartWidget(context),
          extrainfoPartWidget(context),
          flaggedContainer(context),
          post.data.pinnedTag.isNotEmpty
              ? creatorPod(context, post.data.pinnedTag)
              : const SliverToBoxAdapter(child: SizedBox()),
          flagPartWiget(context),
          const SliverToBoxAdapter(child: SizedBox(height: 60))
        ],
      ),
    );
  }

//<<<<<<<<<<<<<<<<<<<<<MAINBODY
  Widget dropDownMenu(BuildContext context) {
    return SliverToBoxAdapter(
      key: Key('dropdown'),
      child: Center(
        child: DropdownMenu(
            onSelected: (value) {
              setState(() {
                post.objectType = value!;
              });
            },
            inputDecorationTheme: InputDecorationTheme(
                filled: true,
                fillColor: palette.grey,
                focusColor: palette.grey,
                hoverColor: palette.grey,
                constraints: BoxConstraints(minWidth: 500, minHeight: 60)),
            width: 300,
            menuStyle: MenuStyle(
              minimumSize: MaterialStatePropertyAll(Size(300, 60)),
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
        itemCount: post.data.byte.length,
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child:
                      Image.memory(Uint8List.fromList(post.data.byte[index]))));
        },
      ),
    ));
  }

  Widget dummyMediaContentPartWidget(BuildContext context) {
    return SliverToBoxAdapter(
        child: Padding(
            padding: EdgeInsets.all(8),
            child: Container(
                decoration: BoxDecoration(
                  color: palette.grey,
                  borderRadius: BorderRadius.circular(15),
                  // border: Border.all(color: palette.black)
                ),
                child: Image.asset('assets/images/clickfile.png'))));
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
                  post.data.extra_info = value!;
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
          height: 250,
          decoration: BoxDecoration(
            color: palette.grey,
            borderRadius: BorderRadius.circular(15),
            // border: Border.all(color: palette.black)
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              """
tagged:

${post.data.flag}
""",
            ),
          ),
        ),
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
                  style: TextStyle(
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
                  prefixStyle: TextStyle(fontSize: 20),
                  // labelText: 'flag',
                  hintStyle: TextStyle(color: palette.black),
                  hoverColor: palette.grey,
                  prefixIcon: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(
                            onPressed: () {
                              setState(() {
                                flag = '@';
                              });
                              debugPrint(flag);
                            },
                            icon: Icon(Icons.alternate_email_rounded)),
                        IconButton(
                            onPressed: () {
                              setState(() {
                                flag = '#';
                              });
                              debugPrint(flag);
                            },
                            icon: Icon(Icons.tag)),
                        VerticalDivider()
                      ],
                    ),
                  ),
                  suffixIcon: CircleAvatar(
                    child: GestureDetector(
                      onLongPress: () {
                        setState(() {
                          post.data.pinnedTag = flagged;
                        });
                        print('the pinned tag is ${post.data.pinnedTag}');
                      },
                      child: IconButton(
                        onPressed: () {
                          setState(() {
                            post.data.flag.add(flagged);
                          });
                          print('just flagged a post, ${post.data.flag.last}');
                        },
                        icon: Icon(Icons.outlined_flag_sharp),
                      ),
                    ),
                  )),
            )),
      ),
    );
  }

// MAINBODY >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

  Widget FilePickScreen(BuildContext context) {
    return (Text('pickfile'));
  }

  Widget TextInputScreen(BuildContext context) {
    return (Text('textInput'));
  }

  Widget TagInputScreen(BuildContext context) {
    return (Text('TagInput'));
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

  Widget bottomNavigationBar(BuildContext context) {
    return NavigationBar(
      backgroundColor: Colors.white30,
      selectedIndex: selectedPageIndex,
      onDestinationSelected: (int index) => setState(() {
        selectedPageIndex = index;
      }),
      height: 70,
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon:
              Icon(Icons.photo_camera_outlined, size: 40, color: palette.black),
          selectedIcon: Icon(Icons.camera_alt, size: 40, color: palette.red),
          label: 'camera',
        ),
        NavigationDestination(
          icon:
              Icon(Icons.upload_file_outlined, size: 40, color: palette.black),
          label: 'file',
          selectedIcon:
              Icon(Icons.upload_file_rounded, size: 40, color: palette.red),
        ),
        NavigationDestination(
          icon: Icon(Icons.drive_file_rename_outline,
              size: 40, color: palette.black),
          selectedIcon: Icon(Icons.drive_file_rename_outline_rounded,
              size: 40, color: palette.red),
          label: 'write',
        ),
        NavigationDestination(
          icon: Icon(Icons.flag_outlined, size: 40, color: palette.black),
          selectedIcon: Icon(Icons.tag, size: 40, color: palette.red),
          label: 'tag',
        ),
      ],
    );
  }
}
