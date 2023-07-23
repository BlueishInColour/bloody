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
        singleCommand('print image binary', () => printSomething())
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
