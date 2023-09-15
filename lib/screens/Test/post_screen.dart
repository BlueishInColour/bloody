import 'package:flutter/material.dart';
import '../../main.dart';
import '../../under_construction_screen.dart';

import 'package:flutter_imagekit/flutter_imagekit.dart';
import '../../apis/deta_a.dart';
import '../../constant/configs.dart';
import 'package:http/http.dart' as http;

import 'package:image_picker/image_picker.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  String file_path = '';
  String save_in_path = '/file/save.png';
  @override
  Widget build(BuildContext context) {
    getCameraPath() async {
      print('clicked');
      var filePath =
          await ImagePicker.platform.pickImage(source: ImageSource.camera);

      String path = filePath!.path;

      print(path);
      return path;
    }

    getFilePath() async {
      print('clicked');
      var filePath =
          await ImagePicker.platform.pickImage(source: ImageSource.gallery);

      String path = filePath!.path;
      print(path);

      setState(() {
        file_path = path;
      });
      print(file_path);
      return path;
    }

    post() async {
      print('clicked');
      String url =
          'http://localhost:8000/dropbox/upload_file?file_path=$file_path&save_in_path=$save_in_path';
      var res = await http.post(Uri.parse(url));
      print(res);
    }

    Widget aButton(
      Function() function, {
      String text = 'button',
      IconData icon = Icons.play_arrow,
    }) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(palette.grey)),
            onPressed: function,
            child: Row(children: [Icon(icon), Text(text)])),
      );
    }

    bottom(context) {
      return Container(
        // color: palette.amber,
        height: 50,
        child: Row(
          //   scrollDirection: Axis.horizontal,
          children: [
            aButton(() => debugPrint('clicked'),
                icon: Icons.camera_alt_rounded, text: 'camera'),
            aButton(() => getFilePath(),
                icon: Icons.video_file_rounded, text: 'file'),
            aButton(
              () {},
              icon: Icons.text_fields,
              text: 'text',
            ),
          ],
        ),
      );
    }

    return Scaffold(
        backgroundColor: palette.white,
        appBar: AppBar(
          title: Text(''),
          leading: IconButton(
              icon: Icon(Icons.cancel_outlined),
              onPressed: () => Navigator.pop(context)),
          actions: [
            ElevatedButton(
              child: Text('post'),
              onPressed: () {
                print('about to post');
                post();
              },
            )
          ],
        ),
        bottomSheet: bottom(context),
        body: SafeArea(
          child: ListView(
            children: [
              Container(
                  height: 400,
                  child: TextField(
                    maxLines: 20,
                  )),
            ],
          ),
        ));
  }
}
