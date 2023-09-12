import 'package:flutter/material.dart';
import '../../under_construction_screen.dart';
import './floating_search_button.dart';
import '../../main.dart';

class PurseScreen extends StatefulWidget {
  const PurseScreen({super.key});

  @override
  State<PurseScreen> createState() => PurseScreenState();
}

class PurseScreenState extends State<PurseScreen> {
  @override
  Widget build(BuildContext context) {
    Widget body(context) {
      Widget actionButton(context,
          {String text = 'send',
          IconData iconData = Icons.file_upload_outlined}) {
        return Column(
          children: [
            CircleAvatar(
              backgroundColor: palette.amber,
              child: IconButton(
                  onPressed: () {}, icon: Icon(iconData, color: palette.black)),
            ),
            Text(text, style: TextStyle(color: palette.amber))
          ],
        );
      }

      Widget oneTransaction(context) {
        return ListTile();
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Container(
                height: 100,
                decoration: BoxDecoration(
                    color: palette.amber,
                    borderRadius: BorderRadius.circular(15))),
            Divider(),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
              actionButton(context),
              actionButton(context, text: 'add', iconData: Icons.add),
              actionButton(context,
                  text: 'request', iconData: Icons.ring_volume_outlined)
            ]),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text('transactions history',
                    style:
                        TextStyle(color: palette.textColorLight, fontSize: 12)),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return oneTransaction(context);
                  }),
            ),
          ],
        ),
      );
    }

    return Scaffold(
      body: body(context),
    );
  }
}
