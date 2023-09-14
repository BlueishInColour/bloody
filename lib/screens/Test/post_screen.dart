import 'package:flutter/material.dart';
import '../../main.dart';
import '../../under_construction_screen.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});
  @override
  State<PostScreen> createState() => PostScreenState();
}

class PostScreenState extends State<PostScreen> {
  @override
  Widget build(BuildContext context) {
    Widget aButton(
        {String text = 'button',
        IconData icon = Icons.play_arrow,
        required Function function}) {
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStatePropertyAll(palette.grey)),
            onPressed: () => function,
            child: Row(children: [Icon(icon), Text(text)])),
      );
    }

    return Scaffold(
        backgroundColor: palette.white,
        appBar:
            AppBar(title: Text('post'), leading: Icon(Icons.cancel_outlined)),
        body: SafeArea(
          child: Column(
            children: [
              Container(
                  height: 400,
                  child: TextField(
                    maxLines: 20,
                  )),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 300,
                  height: 40,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      aButton(
                          function: () {},
                          icon: Icons.camera_alt_rounded,
                          text: 'camera'),
                      aButton(
                          function: () {},
                          icon: Icons.video_file_rounded,
                          text: 'file'),
                      aButton(
                        function: () {},
                        icon: Icons.text_fields,
                        text: 'text',
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
