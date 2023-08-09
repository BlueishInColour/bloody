import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../main.dart';
import '../Apis/cosmsosdb.dart';
import './Test/create_user_screen.dart';
import './Test/list_users.screen.dart';

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
        singleCommand('create cosmos db', () => createdb()),
        singleCommand('getdb', () => get()),
        singleCommand('deletedb', () => deletedb()),
        singleCommand('get list', () => listdb()),
        ////////////
        singleCommand('create collection', () => createCollection()),
        singleCommand('get collection', () => getCollection()),
        singleCommand('delete collection ', () => deleteCollection()),
        singleCommand('get list collection', () => listCollection()),
        //////////
        //  singleCommand('create Document', () => createDocument()),
        singleCommand('list document', () => listDocument()),
        singleCommand('get document', () => getDocument('oio')),

        singleCommand(
            'go to create user screen',
            () => Navigator.push(
                context,
                PageRouteBuilder(
                    pageBuilder: (context, _, __) => CreateUser()))),
        singleCommand(
            'go to create get user screen',
            () => Navigator.push(context,
                PageRouteBuilder(pageBuilder: (context, _, __) => List())))
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
      future: null,
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
