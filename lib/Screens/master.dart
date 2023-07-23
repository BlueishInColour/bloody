import 'dart:convert';
import 'package:upstash_redis/upstash_redis.dart';
import 'dart:typed_data';

import 'package:bloody/Models/post_model.dart';
import 'package:flutter/material.dart';
import '../Models/explore_screen_models.dart';
import '../Models/create_freak.dart';
import '../Models/follow_freak.dart';

class Master extends StatefulWidget {
  Master({super.key});

  @override
  State<Master> createState() => MasterState();
}

class MasterState extends State<Master> {
  String ext = '';
  String bytes = '';
  set() {
    print('started getting stuff out of db');
    var byt = getPosts();
    setState(() {
      bytes = byt.toString();
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
        Image.memory(base64Decode(bytes))
      ],
    ));
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
