import 'package:flutter/material.dart';
import '../Models/explore_screen_models.dart';

class Master extends StatelessWidget {
  const Master({super.key});

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
            'create all database and table', () => createDatabaseAndTable())
      ],
    ));
  }

  Widget singleCommand(String text, Function() onPressed) {
    return (Row(
      children: [
        Expanded(
          child: Text(text),
        ),
        IconButton(
            onPressed: onPressed, icon: Icon(Icons.g_mobiledata, size: 20))
      ],
    ));
  }
}
