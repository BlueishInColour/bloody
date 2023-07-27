import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../main.dart';

class PostUpload extends StatefulWidget {
  PostUpload({super.key});

  @override
  State<PostUpload> createState() => PostUploadState();
}

class PostUploadState extends State<PostUpload> {
  int selectedPageIndex = 0;
  final images = <File>[];
  var textinfo = '';

  var hashtags = <String>[];
  getFileImages() async {
    print('connected');
    var image = await ImagePicker.platform.pickImage(
      source: ImageSource.gallery,
    );

    String bytes = await image!.readAsBytes().toString();
    var file = File(bytes);
    return file;
  }

  initialImage() async {
    var image = await PickedFile('assets/images/clickfile.png');
    String bytes = await image!.readAsBytes().toString();
    return bytes;
  }

  getCameraImages() async {
    print('connected');
    var image = await ImagePicker.platform.pickImage(
        source: ImageSource.camera, preferredCameraDevice: CameraDevice.rear);
    List<int> bytes = await image!.readAsBytes();
    return bytes;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: [
        MainBody(context),
        FilePickScreen(context),
        TextInputScreen(context),
        TagInputScreen(context)
      ][selectedPageIndex],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return (AppBar(
        backgroundColor: Colors.white12,
        foregroundColor: Colors.red,
        leadingWidth: 40,
        leading: IconButton(
          icon: Icon(Icons.local_fire_department_rounded,
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
              onPressed: () => debugPrint('clicked'),
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
    bool person = false;
    bool hashtag = false;

    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          key: Key('dropdown'),
          child: Center(
            child: DropdownMenu(
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
                  DropdownMenuEntry(value: 'design', label: 'design'),
                  //   DropdownMenuEntry(value: 'none', label: 'none'),
                ]),
          ),
        ),
        SliverToBoxAdapter(
            child: Container(
          height: 400,
          color: palette.white,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            addAutomaticKeepAlives: true,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.asset(
                      'assets/images/clickfile.png',
                      width: 300,
                      fit: BoxFit.cover,
                    )),
              );
            },
          ),
        )),
        SliverToBoxAdapter(
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
                  decoration: InputDecoration(
                      hoverColor: palette.grey,
                      hintText: 'extra information',
                      hintStyle: TextStyle(color: palette.black)),
                  minLines: 20,
                  maxLines: 21,
                )),
          ),
        ),
        SliverToBoxAdapter(
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
                        child: IconButton(
                          onPressed: () => debugPrint('hashed'),
                          icon: Icon(Icons.outlined_flag_sharp),
                        ),
                      )),
                )),
          ),
        )
      ],
    );
  }

  Widget FilePickScreen(BuildContext context) {
    return (Text('pickfile'));
  }

  Widget TextInputScreen(BuildContext context) {
    return (Text('textInput'));
  }

  Widget TagInputScreen(BuildContext context) {
    return (Text('TagInput'));
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
          icon: Icon(Icons.camera_alt, size: 40, color: palette.black),
          selectedIcon: Icon(Icons.camera_alt, size: 40, color: palette.red),
          label: 'camera',
        ),
        NavigationDestination(
          icon: Icon(Icons.upload_file_rounded, size: 40, color: palette.black),
          label: 'file',
          selectedIcon:
              Icon(Icons.upload_file_rounded, size: 40, color: palette.red),
        ),
        NavigationDestination(
          icon: Icon(Icons.drive_file_rename_outline_rounded,
              size: 40, color: palette.black),
          selectedIcon: Icon(Icons.drive_file_rename_outline_rounded,
              size: 40, color: palette.red),
          label: 'write',
        ),
        NavigationDestination(
          icon: Icon(Icons.flag, size: 40, color: palette.black),
          selectedIcon: Icon(Icons.tag, size: 40, color: palette.red),
          label: 'tag',
        ),
      ],
    );
  }
}
