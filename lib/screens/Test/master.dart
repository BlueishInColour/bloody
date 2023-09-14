import 'dart:convert';

import 'package:flutter/material.dart';
import '../../main.dart';
import 'create_user_screen.dart';
import 'list_users.screen.dart';
import '../../apis/imagekit.dart';
import '../../apis/deta_a.dart';
import '../../apis/rubicous.dart'; 


class Master extends StatefulWidget {
  const Master({super.key});

  @override
  State<Master> createState() => MasterState();
}

class MasterState extends State<Master> {
  String ext = '';
  // Uint8List bytes = List<int>[];

  @override
  Widget build(BuildContext context) {
    return (Scaffold(
        appBar: AppBar(
          title: const Text('master command page'),
        ),
        body: commandPage(context)));
  }

  Widget commandPage(BuildContext context) {
    return (ListView(
      children: [
        //  singleCommand('create cosmos db', () => createdb()),
        //  singleCommand('getdb', () => get()),
        //  singleCommand('deletedb', () => deletedb()),
        //  singleCommand('get list', () => listdb()),
        //  ////////////
        //  singleCommand('create collection', () => createCollection()),
        //  singleCommand('get collection', () => getCollection()),
        //  singleCommand('delete collection ', () => deleteCollection()),
        //  singleCommand('get list collection', () => listCollection()),
        //  //////////
        //  //  singleCommand('create Document', () => createDocument()),
        //  singleCommand('list document', () => listDocument()),
        //  singleCommand('get document', () => getDocument('oio')),
        // singleCommand('get alot of data', () async {upstash.set(api: upstash.postApi,key: post.id,,)
        //   }),
        singleCommand('test deta platform ', () => upload()),
        singleCommand('get deta from somewhere', ()async{var res = await postApi.fetch();
        print(res);}),
  
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
                style: const TextStyle(fontSize: 18),
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
            // backgroundColor: palette.white,
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
          child: Text(
            text,
            style: TextStyle(color: palette.white),
          ),
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
