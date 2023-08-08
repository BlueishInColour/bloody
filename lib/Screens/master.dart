import 'dart:convert';
import 'package:upstash_redis/upstash_redis.dart';
import 'dart:typed_data';

import 'package:bloody/Apis/create_post_freakon.dart';
import 'package:flutter/material.dart';
import '../Apis/explore_screen_models.dart';
import '../Apis/create_freak.dart';
import '../Apis/follow_freak.dart';
import '../Apis/comment_freakon.dart';
import '../main.dart';
import '../Models/post_model.dart';
import '../Apis/create_user_profile.dart';
import '../Models/user_model.dart';
import 'sign_up_in_out_screen.dart';

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
        singleCommand(
            'create new freak',
            () => createUser(User(
                  age: 3,
                  coverPix: [3],
                  dateOfBirth: 'dwrsd',
                  email: 'eyelase@gmail.com',
                  extra_info: 'not much to say',
                  fullname: 'eyelade oluwapelumi',
                  noOfFollowers: 23,
                  noOfFollowing: 3,
                  phoneNumber: 1231423,
                  profilePix: [3],
                  sex: 'm',
                  typeOfUser: 'the master',
                  username: 'blueishincolour',
                ))),
        singleCommand('create schema', () => createSchema()),
        singleCommand('create follow schema', () => createFollowschema()),
        singleCommand('follow', () => follow('bluosh', 'mummy')),
        singleCommand('print image binary', () => printSomething()),
        singleCommand('create post schema', () => createPostSchema()),
        //   singleCommand('create post upload', () => createPost('BlueshInColour')),
        singleCommand('get posts', () => getPosts()),
        singleCommand(
            'enter login screeen',
            () => Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, _, __) => SignUpInOutScreeen()))),
        //  imagebuilder()
      ],
    ));
  }

  imagebuilder() {
    return FutureBuilder(
      builder: (ctx, AsyncSnapshot<List<Post>> snapshot) {
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
            var post = snapshot.data;
            return Center(
                child: Image.memory(Uint8List.fromList(post![0].data.byte[0])));
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
            onPressed: onPressed,
            icon: const Icon(Icons.g_mobiledata, size: 20))
      ],
    ));
  }
}
