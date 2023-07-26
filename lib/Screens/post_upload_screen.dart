import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import '../main.dart';

class PostUpload extends StatefulWidget {
  PostUpload({super.key});

  @override
  State<PostUpload> createState() => PostUploadState();
}

class PostUploadState extends State<PostUpload> {
  int selectedPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar(context),
      body: [
        CameraCaptureScreen(context),
        FilePickScreen(context),
        TextInputScreen(context),
        TagInputScreen(context)
      ][selectedPageIndex],
      bottomNavigationBar: bottomNavigationBar(context),
    );
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return (AppBar(
        backgroundColor: Colors.black,
        foregroundColor: Colors.red,
        leadingWidth: 40,
        leading: IconButton(
          icon: Icon(Icons.cancel_outlined),
          onPressed: () => Navigator.pop(context),
        ),
        title: Row(
          children: [
            Expanded(
                child: DropdownMenu(
                    width: 140,
                    menuStyle: MenuStyle(
                      //    maximumSize: MaterialStatePropertyAll(Size(140, 40)),
                      backgroundColor: MaterialStatePropertyAll(palette.red),
                      surfaceTintColor: MaterialStatePropertyAll(palette.red),
                    ),
                    label: Text('type',
                        style: TextStyle(fontSize: 12, color: palette.black)),
                    dropdownMenuEntries: const [
                  DropdownMenuEntry(value: 'style', label: 'style'),
                  DropdownMenuEntry(value: 'blog', label: 'blog'),
                  DropdownMenuEntry(value: 'loundry', label: 'loundry'),
                  DropdownMenuEntry(value: 'design', label: 'design'),
                ])),
            Icon(Icons.local_fire_department_rounded,
                color: palette.red, size: 38),
            TextButton(
              style: ButtonStyle(
                  backgroundColor: MaterialStatePropertyAll(palette.red),
                  shape: MaterialStatePropertyAll(StadiumBorder()),
                  foregroundColor: MaterialStatePropertyAll(palette.black)),
              onPressed: () => debugPrint('clicked'),
              child: Text(
                'post',
                style: TextStyle(fontSize: 20),
              ),
            )
          ],
        )));
  }

  Widget CameraCaptureScreen(BuildContext context) {
    return (Text('camera'));
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
      backgroundColor: Colors.black,
      selectedIndex: selectedPageIndex,
      onDestinationSelected: (int index) => setState(() {
        selectedPageIndex = index;
      }),
      height: 70,
      destinations: <NavigationDestination>[
        NavigationDestination(
          icon: Icon(Icons.camera_alt, size: 40, color: palette.white),
          selectedIcon: Icon(Icons.camera_alt, size: 40, color: palette.red),
          label: 'camera',
        ),
        NavigationDestination(
          icon: Icon(Icons.upload_file_rounded, size: 40, color: palette.white),
          label: 'file',
          selectedIcon:
              Icon(Icons.upload_file_rounded, size: 40, color: palette.red),
        ),
        NavigationDestination(
          icon: Icon(Icons.drive_file_rename_outline_rounded,
              size: 40, color: palette.white),
          selectedIcon: Icon(Icons.drive_file_rename_outline_rounded,
              size: 40, color: palette.red),
          label: 'write',
        ),
        NavigationDestination(
          icon: Icon(Icons.tag, size: 40, color: palette.white),
          selectedIcon: Icon(Icons.tag, size: 40, color: palette.red),
          label: 'tag',
        ),
      ],
    );
  }
}
