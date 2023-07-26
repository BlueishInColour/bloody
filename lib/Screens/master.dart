import 'dart:convert';
import 'package:upstash_redis/upstash_redis.dart';
import 'dart:typed_data';

import 'package:bloody/Models/create_post_freakon.dart';
import 'package:flutter/material.dart';
import '../Models/explore_screen_models.dart';
import '../Models/create_freak.dart';
import '../Models/follow_freak.dart';
import '../Models/comment_freakon.dart';
import '../main.dart';

class Master extends StatefulWidget {
  Master({super.key});

  @override
  State<Master> createState() => MasterState();
}

class MasterState extends State<Master> {
  String ext = '';
  // Uint8List bytes = List<int>[];
  set() async {
    print('started getting stuff out of db');
    var byt = await getPosts();
    setState(() {
      //  bytes = byt.toString();
    });

    print('completed the setting of every strings');
  }

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: Text('master command page'),
        ),
        body: CommandPage(context)));
  }

  Widget CommandPage(BuildContext context) {
    return (ListView(
      children: [
        singleCommand('create new freak', () => createfreak(ext)),
        singleCommand('create schema', () => createSchema()),
        singleCommand('create follow schema', () => createFollowschema()),
        singleCommand('follow', () => follow('bluosh', 'mummy')),
        singleCommand('print image binary', () => printSomething()),
        singleCommand('create post schema', () => createPostSchema()),
        singleCommand('create post upload', () => createPost('BlueshInColour')),
        singleCommand('get picture bytes', () => set()),
        singleCommand(
            'create comment schema', () => createCommentFreakonSchema()),
        singleCommand('comment', () => commentFreakon())
      ],
    ));
  }

  imagebuilder() {
    return FutureBuilder(
      builder: (ctx, snapshot) {
        // Checking if future is resolved or not
        if (snapshot.connectionState == ConnectionState.done) {
          // If we got an error
          if (snapshot.hasError) {
            return Center(
              child: Text(
                '${snapshot.error} occurred',
                style: TextStyle(fontSize: 18),
              ),
            );

            // if we got our data
          } else if (snapshot.hasData) {
            // Extracting data from snapshot object
            final data = snapshot.data.toString();
            return Center(child: Image.memory(base64Decode(data)));
          }
        }

        // Displaying LoadingSpinner to indicate waiting state
        return Center(
          child: CircularProgressIndicator(
            color: palette.lightPurple,
            // backgroundColor: palette.black,
            semanticsLabel: 'shoveling some coal in',
          ),
        );
      },

      // Future that needs to be resolved
      // inorder to display something on the Canvas
      future: getPosts(),
    );
  }

  Widget singleCommand(String text, Function() onPressed) {
    return (Row(
      children: [
        Expanded(
          child: Text(text),
        ),
        SizedBox(
            height: 30,
            width: 100,
            child: TextField(
              onChanged: (value) => setState(() {
                ext = value;
              }),
            )),
        IconButton(
            onPressed: onPressed, icon: Icon(Icons.g_mobiledata, size: 20))
      ],
    ));
  }
}
